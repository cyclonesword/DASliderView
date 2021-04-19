//
//  DASliderView.swift
//  Bookka
//
//  Created by Domenico Aiello on 04/04/21.
//

import Foundation
import UIKit

public protocol DAItemView : AnyObject {
    var view: UIView { get }
    var position: Int { get }
    
    init(view: UIView, position: Int)
}

open class DAItemViewImpl : NSObject, DAItemView {
    
    public let view: UIView
    private(set) public var position: Int
    
    public override var description: String {
        return "\(String(describing: type(of: self)))(view: \(view), \n position: \(position)"
        
    }
    
    public required init(view: UIView, position: Int) {
        self.view = view
        self.position = position
    }
    
}

public enum DASliderViewProperty : String {
    case padding, margin, initialMargin, minDragToScroll
}

public enum DASliderViewError : Error {
    case positionOutOfBoundsError
    case dataSourceNotSetError
}

public enum DASliderViewDirection: Int {
    case left = -1, right = 1
}

public enum DASliderViewLayoutManager: Int {
    case centered, leftBound
}

public protocol DASliderViewDataSouce {
    
    // Required function implementations
    func viewForItem(at position: Int, recycling convertView: DAItemView?, sliderView: DASliderView) -> DAItemView
    func sizeForItem(at position: Int, sliderView: DASliderView) -> CGSize
    func numberOfItems(of sliderView: DASliderView) -> Int
    
}

public protocol DASliderViewDelegate {
    func sliderViewDidScroll(sliderView: DASliderView)
    func sliderViewDidSelect(item: DAItemView, at position: Int, sliderView: DASliderView)
    func sliderViewDidReceiveTapOn(item: DAItemView, at position: Int, sliderView: DASliderView)
    func sliderViewDidReceiveLongTouchOn(item: DAItemView, at position: Int, sliderView: DASliderView)
}

extension DASliderViewDelegate { // Default empty implementation: so they are optional without the ugly
    func sliderViewDidScroll(sliderView: DASliderView) { }
    func sliderViewDidSelect(item: DAItemView, at position: Int, sliderView: DASliderView) { }
    func sliderViewDidReceiveTapOn(item: DAItemView, at position: Int, sliderView: DASliderView) { }
    func sliderViewDidReceiveLongTouchOn(item: DAItemView, at position: Int, sliderView: DASliderView) { }
}


// old stuff

//    internal func get(for sliderView: DASliderView) -> LayoutManager {
//        switch self {
//        case .centered:
//            return CenteredItemLayoutManager(with: sliderView)
//        case .leftBound:
//            return LeftBoundItemLayoutManager(with: sliderView)
//        }
//    }

// Optional function implementations
// @objc optional func paddingForItem(at position: Int, of sliderView: DASliderView) -> CGFloat
//@objc optional func scrollingAnimation(of sliderView: DASliderView) -> UIView.AnimationOptions
//@objc optional func amountOfPointsToPerformScroll(of sliderView: DASliderView) -> CGFloat

//@objc public protocol DASliderView {
//
//    var delegate: DASliderViewDelegate? { get set }
//    var dataSource: DASliderViewDataSouce? { get set }
//
//    var properties: [String : CGFloat] { get }
//    var currentPosition: Int { get }
//    var selectedItem: DAItemView { get }
//    var animationEnabled: Bool { get set }
//    // var parentView: UIView { get }
//    var layoutManager: DASliderViewLayoutManager { get set }
//    var superviewCanInterceptTouchEvents: Bool { get set }
//    var gestureRecognizerDelegate: UIGestureRecognizerDelegate? { get set }
//
//    func setPosition(newPosition: Int, animated: Bool) throws
//    func setItemsPadding(_ padding: CGFloat)
//    func setMinimumDragToScroll(_ amount: CGFloat)
//
//    func initialize()
//    func initialize(withPosition position: Int, properties: [String : CGFloat])
//}

