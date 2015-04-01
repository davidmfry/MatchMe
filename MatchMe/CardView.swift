//
//  CardView.swift
//  MatchMe
//
//  Created by David on 3/31/15.
//  Copyright (c) 2015 David Fry. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView
{
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    
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
        // Stops the autolayout
        self.imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        // Sets the background color for the image view
        self.imageView.backgroundColor = UIColor.redColor()
        // Adds the imageview to the view
        self.addSubview(imageView)
        
        // stops the autolayout
        self.nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        // adds the namelabel to the view
        addSubview(self.nameLabel)
        
        // sets the background color of the view to white
        backgroundColor = UIColor.whiteColor()
        
        // adds a boarder with with the view
        layer.borderWidth = 0.5
        // add a boarder color of lightgray
        layer.borderColor = UIColor.lightGrayColor().CGColor
        // makes the coreners of the view rounded
        layer.cornerRadius = 5
        // stops other added views from going over this views bounds
        layer.masksToBounds = true
        
        self.setConstraints()
    }
    
    private func setConstraints()
    {
        // Constraints for ImageVieww
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0))
        
        // Constraints for Label
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.imageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}