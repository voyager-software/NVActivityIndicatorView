//
//  ActivityIndicator.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

#if canImport(SwiftUI)
import SwiftUI
import UIKit

/// SwiftUI wrapper around `NVActivityIndicatorView`.
///
/// The view has no intrinsic size of its own, so give it an explicit frame:
///
/// ```swift
/// ActivityIndicator(isAnimating: isLoading, type: .ballSpinFadeLoader, color: .white)
///     .frame(width: 50, height: 50)
/// ```
public struct ActivityIndicator: UIViewRepresentable {
    // MARK: Lifecycle

    /// Create a SwiftUI activity indicator.
    ///
    /// Appropriate `NVDefaults.DEFAULT_*` values are used for omitted params.
    ///
    /// - parameters:
    ///   - isAnimating: Whether the indicator is currently animating.
    ///   - type:        Animation type.
    ///   - color:       Color of the indicator.
    ///   - lineWidth:   Stroke width used by stroke-based animations.
    ///   - padding:     Padding inset around the animation.
    public init(
        isAnimating: Bool,
        type: NVActivityIndicatorType? = nil,
        color: UIColor? = nil,
        lineWidth: CGFloat? = nil,
        padding: CGFloat? = nil
    ) {
        self.isAnimating = isAnimating
        self.type = type ?? NVDefaults.DEFAULT_TYPE
        self.color = color ?? NVDefaults.DEFAULT_COLOR
        self.lineWidth = lineWidth ?? NVDefaults.DEFAULT_LINE_WIDTH
        self.padding = padding ?? NVDefaults.DEFAULT_PADDING
    }

    // MARK: Public

    /// Whether the indicator is currently animating.
    public var isAnimating: Bool

    /// Animation type.
    public var type: NVActivityIndicatorType

    /// Color of the indicator.
    public var color: UIColor

    /// Stroke width used by stroke-based animations.
    public var lineWidth: CGFloat

    /// Padding inset around the animation.
    public var padding: CGFloat

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public func makeUIView(context: Context) -> NVActivityIndicatorView {
        NVActivityIndicatorView(
            frame: .zero,
            type: type,
            color: color,
            lineWidth: lineWidth,
            padding: padding
        )
    }

    public func updateUIView(_ view: NVActivityIndicatorView, context: Context) {
        view.type = type
        view.color = color
        view.lineWidth = lineWidth
        view.padding = padding

        // A visual property changing mid-animation needs a restart, since
        // `startAnimating()` is a no-op while already running.
        let appearance = Appearance(type: type, color: color, lineWidth: lineWidth, padding: padding)
        let appearanceChanged = context.coordinator.appearance != appearance
        context.coordinator.appearance = appearance

        if isAnimating {
            if appearanceChanged, view.isAnimating {
                view.stopAnimating()
            }
            view.startAnimating()
        } else {
            view.stopAnimating()
        }
    }

    // MARK: - Coordinator

    public final class Coordinator {
        var appearance: Appearance?
    }

    public struct Appearance: Equatable {
        let type: NVActivityIndicatorType
        let color: UIColor
        let lineWidth: CGFloat
        let padding: CGFloat
    }
}
#endif
