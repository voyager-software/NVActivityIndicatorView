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

    func testStartAnimatingAddsSublayers() {
        let view = self.makeSizedView()
        XCTAssertNil(view.layer.sublayers)
        view.startAnimating()
        XCTAssertFalse(view.layer.sublayers?.isEmpty ?? true)
    }

    func testStartAnimatingIsIdempotent() {
        let view = self.makeSizedView()
        view.startAnimating()
        let firstLayer = view.layer.sublayers?.first.map(ObjectIdentifier.init)

        // Second call must be a no-op: the animation is not torn down and rebuilt.
        view.startAnimating()
        XCTAssertTrue(view.isAnimating)
        XCTAssertEqual(view.layer.sublayers?.first.map(ObjectIdentifier.init), firstLayer)
    }

    func testStopAnimatingWhenNotAnimatingIsNoOp() {
        let view = self.makeSizedView()
        XCTAssertFalse(view.isAnimating)
        view.stopAnimating()
        XCTAssertFalse(view.isAnimating)
        XCTAssertTrue(view.isHidden)
    }

    func testBoundsChangeRebuildsAnimationWhileAnimating() {
        let view = self.makeSizedView()
        view.startAnimating()
        let firstLayer = view.layer.sublayers?.first.map(ObjectIdentifier.init)

        view.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
        XCTAssertFalse(view.layer.sublayers?.isEmpty ?? true)
        // setUpAnimation clears and recreates sublayers, so the instances differ.
        XCTAssertNotEqual(view.layer.sublayers?.first.map(ObjectIdentifier.init), firstLayer)
    }

    func testBoundsChangeDoesNothingWhenNotAnimating() {
        let view = self.makeSizedView()
        view.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
        XCTAssertNil(view.layer.sublayers)
    }

    func testAccessibilityConfiguration() {
        let view = self.makeSizedView()
        XCTAssertTrue(view.isAccessibilityElement)
        XCTAssertEqual(view.accessibilityLabel, "In progress")
        XCTAssertTrue(view.accessibilityTraits.contains(.updatesFrequently))
    }

    func testRespectsReduceMotionDefaultsFalse() {
        XCTAssertFalse(self.makeSizedView().respectsReduceMotion)
    }

    func testTogglingRespectsReduceMotionWhileAnimatingKeepsAnimating() {
        let view = self.makeSizedView()
        view.startAnimating()
        view.respectsReduceMotion = true
        XCTAssertTrue(view.isAnimating)
        XCTAssertFalse(view.layer.sublayers?.isEmpty ?? true)
    }

    // MARK: Private

    private var activityIndicatorView = NVActivityIndicatorView(frame: .zero)

    private func makeSizedView() -> NVActivityIndicatorView {
        NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    }
}
