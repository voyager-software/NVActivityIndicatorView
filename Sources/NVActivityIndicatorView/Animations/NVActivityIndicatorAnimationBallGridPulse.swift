//
//  NVActivityIndicatorAnimationBallGridPulse.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

class NVActivityIndicatorAnimationBallGridPulse: NVActivityIndicatorAnimationDelegate {
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?) {
        let circleSpacing: CGFloat = 2
        let circleSize = (size.width - circleSpacing * 2) / 3
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let durations: [CFTimeInterval] = [0.72, 1.02, 1.28, 1.42, 1.45, 1.18, 0.87, 1.45, 1.06]
        let beginTime = CACurrentMediaTime()
        let beginTimes: [CFTimeInterval] = [-0.06, 0.25, -0.17, 0.48, 0.31, 0.03, 0.46, 0.78, 0.45]
        let timingFunction = CAMediaTimingFunction(name: .default)

        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.timingFunctions = [timingFunction, timingFunction]
        scaleAnimation.values = [1, 0.5, 1]

        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")

        opacityAnimation.keyTimes = [0, 0.5, 1]
        opacityAnimation.timingFunctions = [timingFunction, timingFunction]
        opacityAnimation.values = [1, 0.7, 1]

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation, opacityAnimation]
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw circles
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color, lineWidth: lineWidth)
                let frame = CGRect(x: x + circleSize * CGFloat(j) + circleSpacing * CGFloat(j),
                                   y: y + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                                   width: circleSize,
                                   height: circleSize)

                animation.duration = durations[3 * i + j]
                animation.beginTime = beginTime + beginTimes[3 * i + j]
                circle.frame = frame
                circle.add(animation, forKey: "animation")
                layer.addSublayer(circle)
            }
        }
    }
}
