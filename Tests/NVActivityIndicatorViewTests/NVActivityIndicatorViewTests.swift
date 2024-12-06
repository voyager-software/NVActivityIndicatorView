//
//  NVActivityIndicatorViewTests.swift
//  NVActivityIndicatorViewTests
//
// The MIT License (MIT)

// Copyright (c) 2016 Vinh Nguyen

import XCTest
@testable import NVActivityIndicatorView

@MainActor
class NVActivityIndicatorViewTests: XCTestCase {
    // MARK: Internal

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDefaultValues() {
        XCTAssertEqual(NVDefaults.DEFAULT_TYPE, NVActivityIndicatorType.ballSpinFadeLoader)
        XCTAssertEqual(NVDefaults.DEFAULT_COLOR, UIColor.white)
        XCTAssertEqual(NVDefaults.DEFAULT_PADDING, 0)
        XCTAssertEqual(NVDefaults.DEFAULT_BLOCKER_SIZE, CGSize(width: 60, height: 60))
        XCTAssertEqual(NVDefaults.DEFAULT_BLOCKER_MINIMUM_DISPLAY_TIME, 0)
        XCTAssertEqual(NVDefaults.DEFAULT_BLOCKER_DISPLAY_TIME_THRESHOLD, 0)
        XCTAssertEqual(NVDefaults.DEFAULT_BLOCKER_BACKGROUND_COLOR, UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
    }

    func testSetTypeName() {
        self.activityIndicatorView._setTypeName("unknown")
        XCTAssertEqual(self.activityIndicatorView.type, NVDefaults.DEFAULT_TYPE)
        self.activityIndicatorView._setTypeName("Orbit")
        XCTAssertEqual(self.activityIndicatorView.type, .orbit)
        self.activityIndicatorView._setTypeName("orbit")
        XCTAssertEqual(self.activityIndicatorView.type, .orbit)
        self.activityIndicatorView._setTypeName("orbiT")
        XCTAssertEqual(self.activityIndicatorView.type, .orbit)
    }

    func testGetTypeName() {
        self.activityIndicatorView.type = .audioEqualizer
        XCTAssertEqual(self.activityIndicatorView.getTypeName(), String(describing: NVActivityIndicatorType.audioEqualizer))
    }

    func testInitWithParams() {
        let type: NVActivityIndicatorType = .audioEqualizer
        let color = UIColor.red
        let padding: CGFloat = 10

        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, type: type)
        XCTAssertEqual(self.activityIndicatorView.type, type)

        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, color: color)
        XCTAssertEqual(self.activityIndicatorView.color, color)

        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, padding: padding)
        XCTAssertEqual(self.activityIndicatorView.padding, padding)

        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect.zero, type: type, color: color, padding: padding)
        XCTAssertEqual(self.activityIndicatorView.type, type)
        XCTAssertEqual(self.activityIndicatorView.color, color)
        XCTAssertEqual(self.activityIndicatorView.padding, padding)
    }

    func testInitWithFrame() {
        self.activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        XCTAssertEqual(self.activityIndicatorView.type, NVDefaults.DEFAULT_TYPE)
        XCTAssertEqual(self.activityIndicatorView.color, NVDefaults.DEFAULT_COLOR)
        XCTAssertEqual(self.activityIndicatorView.padding, NVDefaults.DEFAULT_PADDING)
    }

    func testStartAnimating() {
        XCTAssertFalse(self.activityIndicatorView.isAnimating)
        XCTAssertTrue(self.activityIndicatorView.isHidden)
        self.activityIndicatorView.startAnimating()
        XCTAssertEqual(self.activityIndicatorView.layer.speed, 1)
        XCTAssertTrue(self.activityIndicatorView.isAnimating)
        XCTAssertFalse(self.activityIndicatorView.isHidden)
    }

    func testStopAnimating() {
        self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.stopAnimating()
        XCTAssertFalse(self.activityIndicatorView.isAnimating)
        XCTAssertTrue(self.activityIndicatorView.isHidden)
        XCTAssertTrue(self.activityIndicatorView.layer.sublayers == nil)
    }

    // MARK: Private

    private var activityIndicatorView = NVActivityIndicatorView(frame: .zero)
}
