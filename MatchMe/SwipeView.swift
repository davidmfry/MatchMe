//
//  SwipeView.swift
//  MatchMe
//
//  Created by David on 3/31/15.
//  Copyright (c) 2015 David Fry. All rights reserved.
//

import Foundation
import UIKit

class SwipeView: UIView
{
    private let card = CardView()
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
        addSubview(card)
        
        // add a gesture recognizer the action is the name of a function called dragged
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragged:"))
        self.card.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
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
                self.resetViewPosisitionAndTransform()
            default:
                println("Defualt triggered for GestureRecognizer")
                break
        }
        
        
        println("Distance x: \(distance.x) y: \(distance.y)")
    }
    
    private func resetViewPosisitionAndTransform()
    {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.center = self.originalPoint!
            self.transform = CGAffineTransformMakeRotation(0)
        })
    }
}


































