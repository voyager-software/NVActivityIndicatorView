//
//  NVActivityIndicatorType.swift
//  NVActivityIndicatorView
//
//  Created by Gabor Shaio on 2024-12-05.
//

/**
 Enum of animation types used for activity indicator view.

 - Blank:                   Blank animation.
 - BallPulse:               BallPulse animation.
 - BallGridPulse:           BallGridPulse animation.
 - BallClipRotate:          BallClipRotate animation.
 - SquareSpin:              SquareSpin animation.
 - BallClipRotatePulse:     BallClipRotatePulse animation.
 - BallClipRotateMultiple:  BallClipRotateMultiple animation.
 - BallPulseRise:           BallPulseRise animation.
 - BallRotate:              BallRotate animation.
 - CubeTransition:          CubeTransition animation.
 - BallZigZag:              BallZigZag animation.
 - BallZigZagDeflect:       BallZigZagDeflect animation.
 - BallTrianglePath:        BallTrianglePath animation.
 - BallScale:               BallScale animation.
 - LineScale:               LineScale animation.
 - LineScaleParty:          LineScaleParty animation.
 - BallScaleMultiple:       BallScaleMultiple animation.
 - BallPulseSync:           BallPulseSync animation.
 - BallBeat:                BallBeat animation.
 - BallDoubleBounce:        BallDoubleBounce animation.
 - LineScalePulseOut:       LineScalePulseOut animation.
 - LineScalePulseOutRapid:  LineScalePulseOutRapid animation.
 - BallScaleRipple:         BallScaleRipple animation.
 - BallScaleRippleMultiple: BallScaleRippleMultiple animation.
 - BallSpinFadeLoader:      BallSpinFadeLoader animation.
 - LineSpinFadeLoader:      LineSpinFadeLoader animation.
 - TriangleSkewSpin:        TriangleSkewSpin animation.
 - Pacman:                  Pacman animation.
 - BallGridBeat:            BallGridBeat animation.
 - SemiCircleSpin:          SemiCircleSpin animation.
 - BallRotateChase:         BallRotateChase animation.
 - Orbit:                   Orbit animation.
 - AudioEqualizer:          AudioEqualizer animation.
 - CircleStrokeSpin:        CircleStrokeSpin animation.
 */
public enum NVActivityIndicatorType: CaseIterable, Sendable {
    /**
     Blank.

     - returns: Instance of NVActivityIndicatorAnimationBlank.
     */
    case blank
    /**
     BallPulse.

     - returns: Instance of NVActivityIndicatorAnimationBallPulse.
     */
    case ballPulse
    /**
     BallGridPulse.

     - returns: Instance of NVActivityIndicatorAnimationBallGridPulse.
     */
    case ballGridPulse
    /**
     BallClipRotate.

     - returns: Instance of NVActivityIndicatorAnimationBallClipRotate.
     */
    case ballClipRotate
    /**
     SquareSpin.

     - returns: Instance of NVActivityIndicatorAnimationSquareSpin.
     */
    case squareSpin
    /**
     BallClipRotatePulse.

     - returns: Instance of NVActivityIndicatorAnimationBallClipRotatePulse.
     */
    case ballClipRotatePulse
    /**
     BallClipRotateMultiple.

     - returns: Instance of NVActivityIndicatorAnimationBallClipRotateMultiple.
     */
    case ballClipRotateMultiple
    /**
     BallPulseRise.

     - returns: Instance of NVActivityIndicatorAnimationBallPulseRise.
     */
    case ballPulseRise
    /**
     BallRotate.

     - returns: Instance of NVActivityIndicatorAnimationBallRotate.
     */
    case ballRotate
    /**
     CubeTransition.

     - returns: Instance of NVActivityIndicatorAnimationCubeTransition.
     */
    case cubeTransition
    /**
     BallZigZag.

     - returns: Instance of NVActivityIndicatorAnimationBallZigZag.
     */
    case ballZigZag
    /**
     BallZigZagDeflect

     - returns: Instance of NVActivityIndicatorAnimationBallZigZagDeflect
     */
    case ballZigZagDeflect
    /**
     BallTrianglePath.

     - returns: Instance of NVActivityIndicatorAnimationBallTrianglePath.
     */
    case ballTrianglePath
    /**
     BallScale.

     - returns: Instance of NVActivityIndicatorAnimationBallScale.
     */
    case ballScale
    /**
     LineScale.

     - returns: Instance of NVActivityIndicatorAnimationLineScale.
     */
    case lineScale
    /**
     LineScaleParty.

     - returns: Instance of NVActivityIndicatorAnimationLineScaleParty.
     */
    case lineScaleParty
    /**
     BallScaleMultiple.

     - returns: Instance of NVActivityIndicatorAnimationBallScaleMultiple.
     */
    case ballScaleMultiple
    /**
     BallPulseSync.

     - returns: Instance of NVActivityIndicatorAnimationBallPulseSync.
     */
    case ballPulseSync
    /**
     BallBeat.

     - returns: Instance of NVActivityIndicatorAnimationBallBeat.
     */
    case ballBeat
    /**
     BallDoubleBounce.

     - returns: Instance of NVActivityIndicatorAnimationBallDoubleBounce.
     */
    case ballDoubleBounce
    /**
     LineScalePulseOut.

     - returns: Instance of NVActivityIndicatorAnimationLineScalePulseOut.
     */
    case lineScalePulseOut
    /**
     LineScalePulseOutRapid.

     - returns: Instance of NVActivityIndicatorAnimationLineScalePulseOutRapid.
     */
    case lineScalePulseOutRapid
    /**
     BallScaleRipple.

     - returns: Instance of NVActivityIndicatorAnimationBallScaleRipple.
     */
    case ballScaleRipple
    /**
     BallScaleRippleMultiple.

     - returns: Instance of NVActivityIndicatorAnimationBallScaleRippleMultiple.
     */
    case ballScaleRippleMultiple
    /**
     BallSpinFadeLoader.

     - returns: Instance of NVActivityIndicatorAnimationBallSpinFadeLoader.
     */
    case ballSpinFadeLoader
    /**
     LineSpinFadeLoader.

     - returns: Instance of NVActivityIndicatorAnimationLineSpinFadeLoader.
     */
    case lineSpinFadeLoader
    /**
     TriangleSkewSpin.

     - returns: Instance of NVActivityIndicatorAnimationTriangleSkewSpin.
     */
    case triangleSkewSpin
    /**
     Pacman.

     - returns: Instance of NVActivityIndicatorAnimationPacman.
     */
    case pacman
    /**
     BallGridBeat.

     - returns: Instance of NVActivityIndicatorAnimationBallGridBeat.
     */
    case ballGridBeat
    /**
     SemiCircleSpin.

     - returns: Instance of NVActivityIndicatorAnimationSemiCircleSpin.
     */
    case semiCircleSpin
    /**
     BallRotateChase.

     - returns: Instance of NVActivityIndicatorAnimationBallRotateChase.
     */
    case ballRotateChase
    /**
     Orbit.

     - returns: Instance of NVActivityIndicatorAnimationOrbit.
     */
    case orbit
    /**
     AudioEqualizer.

     - returns: Instance of NVActivityIndicatorAnimationAudioEqualizer.
     */
    case audioEqualizer
    /**
     Stroke.

     - returns: Instance of NVActivityIndicatorAnimationCircleStrokeSpin.
     */
    case circleStrokeSpin

    // MARK: Internal

    // swiftlint:disable:next cyclomatic_complexity function_body_length
    func animation() -> NVActivityIndicatorAnimationDelegate {
        switch self {
        case .blank:
            NVActivityIndicatorAnimationBlank()
        case .ballPulse:
            NVActivityIndicatorAnimationBallPulse()
        case .ballGridPulse:
            NVActivityIndicatorAnimationBallGridPulse()
        case .ballClipRotate:
            NVActivityIndicatorAnimationBallClipRotate()
        case .squareSpin:
            NVActivityIndicatorAnimationSquareSpin()
        case .ballClipRotatePulse:
            NVActivityIndicatorAnimationBallClipRotatePulse()
        case .ballClipRotateMultiple:
            NVActivityIndicatorAnimationBallClipRotateMultiple()
        case .ballPulseRise:
            NVActivityIndicatorAnimationBallPulseRise()
        case .ballRotate:
            NVActivityIndicatorAnimationBallRotate()
        case .cubeTransition:
            NVActivityIndicatorAnimationCubeTransition()
        case .ballZigZag:
            NVActivityIndicatorAnimationBallZigZag()
        case .ballZigZagDeflect:
            NVActivityIndicatorAnimationBallZigZagDeflect()
        case .ballTrianglePath:
            NVActivityIndicatorAnimationBallTrianglePath()
        case .ballScale:
            NVActivityIndicatorAnimationBallScale()
        case .lineScale:
            NVActivityIndicatorAnimationLineScale()
        case .lineScaleParty:
            NVActivityIndicatorAnimationLineScaleParty()
        case .ballScaleMultiple:
            NVActivityIndicatorAnimationBallScaleMultiple()
        case .ballPulseSync:
            NVActivityIndicatorAnimationBallPulseSync()
        case .ballBeat:
            NVActivityIndicatorAnimationBallBeat()
        case .ballDoubleBounce:
            NVActivityIndicatorAnimationBallDoubleBounce()
        case .lineScalePulseOut:
            NVActivityIndicatorAnimationLineScalePulseOut()
        case .lineScalePulseOutRapid:
            NVActivityIndicatorAnimationLineScalePulseOutRapid()
        case .ballScaleRipple:
            NVActivityIndicatorAnimationBallScaleRipple()
        case .ballScaleRippleMultiple:
            NVActivityIndicatorAnimationBallScaleRippleMultiple()
        case .ballSpinFadeLoader:
            NVActivityIndicatorAnimationBallSpinFadeLoader()
        case .lineSpinFadeLoader:
            NVActivityIndicatorAnimationLineSpinFadeLoader()
        case .triangleSkewSpin:
            NVActivityIndicatorAnimationTriangleSkewSpin()
        case .pacman:
            NVActivityIndicatorAnimationPacman()
        case .ballGridBeat:
            NVActivityIndicatorAnimationBallGridBeat()
        case .semiCircleSpin:
            NVActivityIndicatorAnimationSemiCircleSpin()
        case .ballRotateChase:
            NVActivityIndicatorAnimationBallRotateChase()
        case .orbit:
            NVActivityIndicatorAnimationOrbit()
        case .audioEqualizer:
            NVActivityIndicatorAnimationAudioEqualizer()
        case .circleStrokeSpin:
            NVActivityIndicatorAnimationCircleStrokeSpin()
        }
    }
}
