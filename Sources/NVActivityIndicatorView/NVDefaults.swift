//
//  NVDefaults.swift
//  NVActivityIndicatorView
//
//  Created by Gabor Shaio on 2024-12-05.
//

import UIKit

enum NVDefaults: Sendable {
    /// Default type. Default value is .BallSpinFadeLoader.
    static let DEFAULT_TYPE: NVActivityIndicatorType = .ballSpinFadeLoader

    /// Default color of activity indicator. Default value is UIColor.white.
    static let DEFAULT_COLOR = UIColor.white

    /// Default color of activity indicator. Default value is UIColor.white.
    static let DEFAULT_LINE_WIDTH: CGFloat = 2

    /// Default color of text. Default value is UIColor.white.
    static let DEFAULT_TEXT_COLOR = UIColor.white

    /// Default padding. Default value is 0.
    static let DEFAULT_PADDING: CGFloat = 0

    /// Default size of activity indicator view in UI blocker. Default value is 60x60.
    static let DEFAULT_BLOCKER_SIZE = CGSize(width: 60, height: 60)

    /// Default display time threshold to actually display UI blocker. Default value is 0 ms.
    ///
    /// - note:
    /// Default time that has to be elapsed (between calls of `startAnimating()` and `stopAnimating()`) in order to actually display UI blocker. It should be set thinking about what the minimum duration of an activity is to be worth showing it to the user. If the activity ends before this time threshold, then it will not be displayed at all.
    static let DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD = 0

    /// Default minimum display time of UI blocker. Default value is 0 ms.
    ///
    /// - note:
    /// Default minimum display time of UI blocker. Its main purpose is to avoid flashes showing and hiding it so fast. For instance, setting it to 200ms will force UI blocker to be shown for at least this time (regardless of calling `stopAnimating()` ealier).
    static let DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME = 0

    /// Default message spacing to activity indicator view in UI blocker. Default value is 8.
    static let DEFAULT_BLOCKER_MESSAGE_SPACING = CGFloat(8.0)

    /// Default font of message displayed in UI blocker. Default value is bold system font, size 20.
    static let DEFAULT_BLOCKER_MESSAGE_FONT = UIFont.boldSystemFont(ofSize: 20)

    /// Default background color of UI blocker. Default value is UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    static let DEFAULT_BLOCKER_BACKGROUND_COLOR = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
}
