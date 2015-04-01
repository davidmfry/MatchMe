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
        card.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.setConstraints()
        
        
    }
    
    private func setConstraints()
    {
        addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: self.card, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0))
    }
}


































