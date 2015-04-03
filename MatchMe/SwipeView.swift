//
//  SwipeView.swift
//  MatchMe
//
//  Created by David on 3/31/15.
//  Copyright (c) 2015 David Fry. All rights reserved.
//

import Foundation
import UIKit

protocol SwipeViewDelegate: class
{
    func swipedLeft()
    func swipedRight()
}

class SwipeView: UIView
{
    enum Direction
    {
        case None
        case Left
        case Right
    }
    
    // Its weak to prevent a memeory problem IE: retain cycle
    weak var delegate: SwipeViewDelegate?
//    private let card = CardView()
    var innerView: UIView? {
        didSet {
            if let v = innerView
            {
                addSubview(v)
                v.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
            }
        }
    }
    private var originalPoint: CGPoint?
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.initialize()
    }
    
    override init()
    {
        super.init()
        self.initialize()
    }
    
    private func initialize()
    {
        self.backgroundColor = UIColor.clearColor()
        
        // add a gesture recognizer the action is the name of a function called dragged
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragged:"))
        self.originalPoint = center
        
    }
    
    func dragged(gestureRecognizer: UIPanGestureRecognizer)
    {
        let distance = gestureRecognizer.translationInView(self)
        
        switch gestureRecognizer.state
        {
            case UIGestureRecognizerState.Began:
                self.originalPoint = center
            case UIGestureRecognizerState.Changed:
                let rotationPercentage = min(distance.x / (self.superview!.frame.width / 2),1)
                let rotationAngle = (CGFloat (2 * M_PI/16) * rotationPercentage)
                transform = CGAffineTransformMakeRotation(rotationAngle)
                center = CGPointMake(self.originalPoint!.x + distance.x, self.originalPoint!.y + distance.y)
            
            case UIGestureRecognizerState.Ended:
                if abs(distance.x) < frame.width / 4
                {
                    self.resetViewPosisitionAndTransform()
                }
                else
                {
                    // if distance is graterthan 0 the card is going right else its going left
                    self.swipe(distance.x > 0 ? Direction.Right : Direction.Left)
                }
                
            
            
            default:
                println("Defualt triggered for GestureRecognizer")
                break
        }
        
        
        println("Distance x: \(distance.x) y: \(distance.y)")
    }
    
    func swipe(swipeDirection: Direction)
    {
        if swipeDirection == Direction.None
        {
            return
        }
        var parentWidth = superview!.frame.size.width
        
        if swipeDirection == Direction.Left
        {
            parentWidth *= -1
        }
        
        UIView.animateWithDuration(0.2, animations: {
            self.center.x = self.frame.origin.x + parentWidth
            }, completion: { success in
                
                if let d = self.delegate
                {
                    swipeDirection == Direction.Right ? d.swipedRight() : d.swipedLeft()
                }
        })
    }
    
    private func resetViewPosisitionAndTransform()
    {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.center = self.originalPoint!
            self.transform = CGAffineTransformMakeRotation(0)
        })
    }
}


































