//
//  NVActivityIndicatorAnimationOrbit.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

class NVActivityIndicatorAnimationOrbit: NVActivityIndicatorAnimationDelegate {
    let duration: CFTimeInterval = 1.9
    let satelliteCoreRatio: CGFloat = 0.25
    let distanceRatio: CGFloat = 1.5 // distance / core size

    var coreSize: CGFloat = 0
    var satelliteSize: CGFloat = 0

    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?) {
        self.coreSize = size.width / (1 + self.satelliteCoreRatio + self.distanceRatio)
        self.satelliteSize = self.coreSize * self.satelliteCoreRatio

        self.ring1InLayer(layer, size: size, color: color, lineWidth: lineWidth)
        self.ring2InLayer(layer, size: size, color: color, lineWidth: lineWidth)
        self.coreInLayer(layer, size: size, color: color, lineWidth: lineWidth)
        self.satelliteInLayer(layer, size: size, color: color, lineWidth: lineWidth)
    }

    func ring1InLayer(_ layer: CALayer, size _: CGSize, color: UIColor, lineWidth: CGFloat?) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.45, 0.45, 1]
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        scaleAnimation.values = [0, 0, 1.3, 2]
        scaleAnimation.duration = self.duration

        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)

        opacityAnimation.keyTimes = [0, 0.45, 1]
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear), timingFunction]
        opacityAnimation.values = [0.8, 0.8, 0]
        opacityAnimation.duration = self.duration

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = self.duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: self.coreSize, height: self.coreSize), color: color, lineWidth: lineWidth)
        let frame = CGRect(x: (layer.bounds.size.width - self.coreSize) / 2,
                           y: (layer.bounds.size.height - self.coreSize) / 2,
                           width: self.coreSize,
                           height: self.coreSize)

        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }

    func ring2InLayer(_ layer: CALayer, size _: CGSize, color: UIColor, lineWidth: CGFloat?) {
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.55, 0.55, 1]
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        scaleAnimation.values = [0, 0, 1.3, 2.1]
        scaleAnimation.duration = self.duration

        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)

        opacityAnimation.keyTimes = [0, 0.55, 0.65, 1]
        scaleAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear), timingFunction]
        opacityAnimation.values = [0.7, 0.7, 0, 0]
        opacityAnimation.duration = self.duration

        // Animation
        let animation = CAAnimationGroup()

        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = self.duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: self.coreSize, height: self.coreSize), color: color, lineWidth: lineWidth)
        let frame = CGRect(x: (layer.bounds.size.width - self.coreSize) / 2,
                           y: (layer.bounds.size.height - self.coreSize) / 2,
                           width: self.coreSize,
                           height: self.coreSize)

        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }

    func coreInLayer(_ layer: CALayer, size _: CGSize, color: UIColor, lineWidth: CGFloat?) {
        let inTimingFunction = CAMediaTimingFunction(controlPoints: 0.7, 0, 1, 0.5)
        let outTimingFunction = CAMediaTimingFunction(controlPoints: 0, 0.7, 0.5, 1)
        let standByTimingFunction = CAMediaTimingFunction(name: .linear)

        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")

        scaleAnimation.keyTimes = [0, 0.45, 0.55, 1]
        scaleAnimation.timingFunctions = [inTimingFunction, standByTimingFunction, outTimingFunction]
        scaleAnimation.values = [1, 1.3, 1.3, 1]
        scaleAnimation.duration = self.duration
        scaleAnimation.repeatCount = HUGE
        scaleAnimation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: self.coreSize, height: self.coreSize), color: color, lineWidth: lineWidth)
        let frame = CGRect(x: (layer.bounds.size.width - self.coreSize) / 2,
                           y: (layer.bounds.size.height - self.coreSize) / 2,
                           width: self.coreSize,
                           height: self.coreSize)

        circle.frame = frame
        circle.add(scaleAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }

    func satelliteInLayer(_ layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?) {
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "position")

        rotateAnimation.path = UIBezierPath(arcCenter: CGPoint(x: layer.bounds.midX, y: layer.bounds.midY),
                                            radius: (size.width - self.satelliteSize) / 2,
                                            startAngle: CGFloat(Double.pi * 1.5),
                                            endAngle: CGFloat(Double.pi * 1.5 + 4 * Double.pi),
                                            clockwise: true).cgPath
        rotateAnimation.duration = self.duration * 2
        rotateAnimation.repeatCount = HUGE
        rotateAnimation.isRemovedOnCompletion = false

        // Draw circle
        let circle = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: self.satelliteSize, height: self.satelliteSize), color: color, lineWidth: lineWidth)
        let frame = CGRect(x: 0, y: 0, width: satelliteSize, height: satelliteSize)

        circle.frame = frame
        circle.add(rotateAnimation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
