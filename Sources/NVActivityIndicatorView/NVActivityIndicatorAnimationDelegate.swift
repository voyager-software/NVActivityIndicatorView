//
//  NVActivityIndicatorDelegate.swift
//  NVActivityIndicatorView
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import UIKit

@MainActor
protocol NVActivityIndicatorAnimationDelegate {
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor, lineWidth: CGFloat?)
}
