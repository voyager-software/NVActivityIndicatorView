//
//  NVActivityIndicatorAnimationLineScalePulseOutRapid.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

class NVActivityIndicatorAnimationLineScalePulseOutRapid: NVActivityIndicatorAnimationDelegate {
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?) {
        let lineSize = size.width / 9
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: CFTimeInterval = 0.9
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0.5, 0.25, 0, 0.25, 0.5]
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.11, 0.49, 0.38, 0.78)

        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.scale.y")

        animation.keyTimes = [0, 0.8, 0.9]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.beginTime = beginTime
        animation.values = [1, 0.3, 1]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false

        // Draw lines
        for i in 0 ..< 5 {
            let line = NVActivityIndicatorShape.line.layerWith(size: CGSize(width: lineSize, height: size.height), color: color, lineWidth: lineWidth)
            let frame = CGRect(x: x + lineSize * 2 * CGFloat(i),
                               y: y,
                               width: lineSize,
                               height: size.height)

            animation.beginTime = beginTime + beginTimes[i]
            line.frame = frame
            line.add(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
}
