# NVActivityIndicatorView

⚠️ Check out [LoaderUI](https://github.com/ninjaprox/LoaderUI) (ready to use with Swift Package Mananger supported) for SwiftUI implementation of this. 🎉

## Introduction

`NVActivityIndicatorView` is a collection of awesome loading animations.

![Demo](https://raw.githubusercontent.com/ninjaprox/NVActivityIndicatorView/master/Demo.gif)

## Animation types

| Type                   | Type                        | Type                   | Type                       |
| ---------------------- | --------------------------- | ---------------------- | -------------------------- |
| 1. ballPulse           | 2. ballGridPulse            | 3. ballClipRotate      | 4. squareSpin              |
| 5. ballClipRotatePulse | 6. ballClipRotateMultiple   | 7. ballPulseRise       | 8. ballRotate              |
| 9. cubeTransition      | 10. ballZigZag              | 11. ballZigZagDeflect  | 12. ballTrianglePath       |
| 13. ballScale          | 14. lineScale               | 15. lineScaleParty     | 16. ballScaleMultiple      |
| 17. ballPulseSync      | 18. ballBeat                | 19. lineScalePulseOut  | 20. lineScalePulseOutRapid |
| 21. ballScaleRipple    | 22. ballScaleRippleMultiple | 23. ballSpinFadeLoader | 24. lineSpinFadeLoader     |
| 25. triangleSkewSpin   | 26. pacman                  | 27. ballGridBeat       | 28. semiCircleSpin         |
| 29. ballRotateChase    | 30. orbit                   | 31. audioEqualizer     | 32. circleStrokeSpin       |

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. To use NVActivityIndicatorView with Swift Package Manger, add it to `dependencies` in your `Package.swift`

```swift
dependencies: [
    .package(url: "https://github.com/ninjaprox/NVActivityIndicatorView.git")
]
```

## Usage

Firstly, import `NVActivityIndicatorView`.

```swift
import NVActivityIndicatorView
```

### Initialization

Then, there are two ways you can create `NVActivityIndicatorView`:

-   By storyboard, changing class of any `UIView` to `NVActivityIndicatorView`.

_**Note:** Set `Module` to `NVActivityIndicatorView`._

-   By code, using initializer. All parameters other than `frame` are optional and [`NVActivityIndicatorView.DEFAULT_*`](https://nvactivityindicatorview.vinhis.me/Classes/NVActivityIndicatorView.html) are used as default values.

```swift
NVActivityIndicatorView(frame: frame, type: type, color: color, padding: padding)
```

### Control

Start animating.

```swift
activityIndicatorView.startAnimating()
```

Stop animating.

```swift
activityIndicatorView.stopAnimating()
```

Determine if it is animating.

```swift
animating = activityIndicatorView.isAnimating
```

### Change properties

In storyboard, you can change all properties in Attributes inspector tab of Utilities panel.

_**Note:** Use one of values (case-insensitive) in [Animation types](#animation-types) for `Type Name`._

All properties are public so you can change them after initializing.

_**Note:** All changes must be made before calling `startAnimating()`._

## Documentation

https://nvactivityindicatorview.vinhis.me/

## Acknowledgment

Thanks [Connor Atherton](https://github.com/ConnorAtherton) for inspired [Loaders.css](https://github.com/ConnorAtherton/loaders.css) and [Danil Gontovnik](https://github.com/gontovnik) for [DGActivityIndicatorView](https://github.com/gontovnik/DGActivityIndicatorView).

## License

The MIT License (MIT)

Copyright (c) 2016 Vinh Nguyen [@ninjaprox](http://twitter.com/ninjaprox)
