//
//  NVActivityIndicatorAnimationBallsBounce.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

class NVActivityIndicatorAnimationBallDoubleBounce: NVActivityIndicatorAnimationDelegate {
    // MARK: Internal

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?) {
        for index in 0 ... 1 {
            self.bouncingBall(in: layer, size: size, color: color, lineWidth: lineWidth, startingAt: CACurrentMediaTime() + Double(index))
        }
    }

    // MARK: Fileprivate

    fileprivate func bouncingBall(in layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?, startingAt: CFTimeInterval) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 2
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [-1, 0, -1]

        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        scaleAnimation.repeatCount = HUGE
        scaleAnimation.isRemovedOnCompletion = false

        let circle = NVActivityIndicatorShape.circle.layerWith(size: size, color: color, lineWidth: lineWidth)
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)

        scaleAnimation.beginTime = startingAt
        circle.frame = frame
        circle.opacity = 0.6
        circle.add(scaleAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
