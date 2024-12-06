//
//  NVActivityIndicatorAnimationSquareSpin.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

class NVActivityIndicatorAnimationSquareSpin: NVActivityIndicatorAnimationDelegate {
    // MARK: Internal

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?) {
        let duration: CFTimeInterval = 3
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.09, 0.57, 0.49, 0.9)

        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform")

        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction]
        animation.values = [
            NSValue(caTransform3D: CATransform3DConcat(self.createRotateXTransform(angle: 0), self.createRotateYTransform(angle: 0))),
            NSValue(caTransform3D: CATransform3DConcat(self.createRotateXTransform(angle: CGFloat(Double.pi)), self.createRotateYTransform(angle: 0))),
            NSValue(caTransform3D: CATransform3DConcat(self.createRotateXTransform(angle: CGFloat(Double.pi)), self.createRotateYTransform(angle: CGFloat(Double.pi)))),
            NSValue(caTransform3D: CATransform3DConcat(self.createRotateXTransform(angle: 0), self.createRotateYTransform(angle: CGFloat(Double.pi)))),
            NSValue(caTransform3D: CATransform3DConcat(self.createRotateXTransform(angle: 0), self.createRotateYTransform(angle: 0))),
        ]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw square
        let square = NVActivityIndicatorShape.rectangle.layerWith(size: size, color: color, lineWidth: lineWidth)
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)

        square.frame = frame
        square.add(animation, forKey: "animation")
        layer.addSublayer(square)
    }

    // MARK: Private

    private func createRotateXTransform(angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 1, 0, 0)

        transform.m34 = CGFloat(-1) / 100

        return transform
    }

    private func createRotateYTransform(angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 0, 1, 0)

        transform.m34 = CGFloat(-1) / 100

        return transform
    }
}
