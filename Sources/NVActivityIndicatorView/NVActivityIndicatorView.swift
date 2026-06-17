//
//  NVActivityIndicatorView.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

/// Activity indicator view with nice animations
public final class NVActivityIndicatorView: UIView {
    // MARK: Lifecycle

    /**
     Returns an object initialized from data in a given unarchiver.
     self, initialized using the data in decoder.

     - parameter decoder: an unarchiver object.

     - returns: self, initialized using the data in decoder.
     */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        isHidden = true
        self.configureAccessibility()
        self.registerForNotifications()
    }

    /**
     Create a activity indicator view.

     Appropriate NVActivityIndicatorView.DEFAULT_* values are used for omitted params.

     - parameter frame:   view's frame.
     - parameter type:    animation type.
     - parameter color:   color of activity indicator view.
     - parameter padding: padding of activity indicator view.

     - returns: The activity indicator view.
     */
    public init(frame: CGRect, type: NVActivityIndicatorType? = nil, color: UIColor? = nil, lineWidth: CGFloat? = nil, padding: CGFloat? = nil) {
        self.type = type ?? NVDefaults.DEFAULT_TYPE
        self.color = color ?? NVDefaults.DEFAULT_COLOR
        self.lineWidth = lineWidth ?? NVDefaults.DEFAULT_LINE_WIDTH
        self.padding = padding ?? NVDefaults.DEFAULT_PADDING
        super.init(frame: frame)
        isHidden = true
        self.configureAccessibility()
        self.registerForNotifications()
    }

    // MARK: Public

    // Fix issue #62
    // Intrinsic content size is used in autolayout
    // that causes mislayout when using with MBProgressHUD.
    /**
     Returns the natural size for the receiving view, considering only properties of the view itself.

     A size indicating the natural size for the receiving view based on its intrinsic properties.

     - returns: A size indicating the natural size for the receiving view based on its intrinsic properties.
     */
    override public var intrinsicContentSize: CGSize {
        CGSize(width: self.bounds.width, height: self.bounds.height)
    }

    override public var bounds: CGRect {
        didSet {
            // setup the animation again for the new bounds
            if oldValue != self.bounds, self.isAnimating {
                self.setUpAnimation()
            }
        }
    }

    /// Animation type.
    public var type: NVActivityIndicatorType = NVDefaults.DEFAULT_TYPE

    /// Color of activity indicator view.
    @IBInspectable public var color: UIColor = NVDefaults.DEFAULT_COLOR

    @IBInspectable public var lineWidth: CGFloat = NVDefaults.DEFAULT_LINE_WIDTH

    /// Padding of activity indicator view.
    @IBInspectable public var padding: CGFloat = NVDefaults.DEFAULT_PADDING

    /// When `true`, the animation is not played while the system "Reduce Motion"
    /// accessibility setting is enabled; the indicator is instead shown frozen in
    /// its initial frame so the loading state stays visible without motion.
    /// Defaults to `false`, preserving the previous always-animate behavior.
    public var respectsReduceMotion: Bool = false {
        didSet {
            if oldValue != self.respectsReduceMotion, self.isAnimating {
                self.setUpAnimation()
            }
        }
    }

    /// Current status of animation, read-only.
    public private(set) var isAnimating: Bool = false

    /// Current status of animation, read-only.
    @available(*, deprecated)
    public var animating: Bool { self.isAnimating }

    /**
     Start animating.
     */
    public final func startAnimating() {
        guard !self.isAnimating else {
            return
        }
        isHidden = false
        self.isAnimating = true
        self.setUpAnimation()
    }

    /**
     Stop animating.
     */
    public final func stopAnimating() {
        guard self.isAnimating else {
            return
        }
        isHidden = true
        self.isAnimating = false
        layer.sublayers?.removeAll()
    }

    // MARK: Internal

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var typeName: String {
        get {
            self.getTypeName()
        }
        set {
            self._setTypeName(newValue)
        }
    }

    // swiftlint:disable:next identifier_name
    func _setTypeName(_ typeName: String) {
        for item in NVActivityIndicatorType.allCases {
            if String(describing: item).caseInsensitiveCompare(typeName) == ComparisonResult.orderedSame {
                self.type = item
                break
            }
        }
    }

    func getTypeName() -> String {
        String(describing: self.type)
    }

    // MARK: Private

    /// Whether the current animation should be frozen rather than played.
    private var shouldFreezeForReduceMotion: Bool {
        self.respectsReduceMotion && UIAccessibility.isReduceMotionEnabled
    }

    /// Exposes the indicator to assistive technologies as a single,
    /// frequently-updating element. While stopped the view is hidden, so
    /// VoiceOver automatically ignores it. Adopters can override
    /// `accessibilityLabel`, or set `isAccessibilityElement = false` to opt out.
    private final func configureAccessibility() {
        isAccessibilityElement = true
        accessibilityTraits.insert(.updatesFrequently)
        if accessibilityLabel == nil {
            accessibilityLabel = "In progress"
        }
    }

    /// Registers for the notifications that require the running animation to be
    /// re-applied. Observers are removed automatically when the view is
    /// deallocated.
    private final func registerForNotifications() {
        let center = NotificationCenter.default

        // "Reduce Motion" toggled: re-apply so the frozen/playing state stays in
        // sync with the system setting.
        center.addObserver(
            self,
            selector: #selector(self.reapplyAnimationIfNeeded),
            name: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil
        )

        // Returning from background: the system strips CAAnimations off layers
        // (even with isRemovedOnCompletion = false), so a running indicator would
        // come back frozen unless we rebuild it.
        center.addObserver(
            self,
            selector: #selector(self.reapplyAnimationIfNeeded),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }

    @objc
    private final func reapplyAnimationIfNeeded() {
        guard self.isAnimating else {
            return
        }
        self.setUpAnimation()
    }

    private final func setUpAnimation() {
        let animation: NVActivityIndicatorAnimationDelegate = self.type.animation()
        var animationRect = frame.inset(by: UIEdgeInsets(top: self.padding, left: self.padding, bottom: self.padding, right: self.padding))
        let minEdge = min(animationRect.width, animationRect.height)

        layer.sublayers = nil
        animationRect.size = CGSize(width: minEdge, height: minEdge)
        animation.setUpAnimation(in: self.layer, size: animationRect.size, color: self.color, lineWidth: self.lineWidth)
        // Freezing at speed 0 leaves the shapes drawn in their initial frame.
        layer.speed = self.shouldFreezeForReduceMotion ? 0 : 1
    }
}
