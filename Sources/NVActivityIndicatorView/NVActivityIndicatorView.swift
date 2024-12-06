//
//  NVActivityIndicatorView.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

/// Function that performs fade in/out animation.
public typealias FadeInAnimation = (UIView) -> Void

/// Function that performs fade out animation.
///
/// - Note: Must call the second parameter on the animation completion.
public typealias FadeOutAnimation = (UIView, @escaping () -> Void) -> Void

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
    }

    // MARK: Public

    /// Default fade in animation.
    public static var DEFAULT_FADE_IN_ANIMATION: FadeInAnimation = { view in
        view.alpha = 0
        UIView.animate(withDuration: 0.25) {
            view.alpha = 1
        }
    }

    /// Default fade out animation.
    public static var DEFAULT_FADE_OUT_ANIMATION: FadeOutAnimation = { view, complete in
        UIView.animate(withDuration: 0.25,
                       animations: {
                           view.alpha = 0
                       },
                       completion: { completed in
                           if completed {
                               complete()
                           }
                       })
    }

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

    // swiftlint:enable identifier_name

    /// Animation type.
    public var type: NVActivityIndicatorType = NVDefaults.DEFAULT_TYPE

    /// Color of activity indicator view.
    @IBInspectable public var color: UIColor = NVDefaults.DEFAULT_COLOR

    @IBInspectable public var lineWidth: CGFloat = NVDefaults.DEFAULT_LINE_WIDTH

    /// Padding of activity indicator view.
    @IBInspectable public var padding: CGFloat = NVDefaults.DEFAULT_PADDING

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
        layer.speed = 1
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

    private final func setUpAnimation() {
        let animation: NVActivityIndicatorAnimationDelegate = self.type.animation()
        var animationRect = frame.inset(by: UIEdgeInsets(top: self.padding, left: self.padding, bottom: self.padding, right: self.padding))
        let minEdge = min(animationRect.width, animationRect.height)

        layer.sublayers = nil
        animationRect.size = CGSize(width: minEdge, height: minEdge)
        animation.setUpAnimation(in: self.layer, size: animationRect.size, color: self.color, lineWidth: self.lineWidth)
    }
}
