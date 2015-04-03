//
//  CardsViewController.swift
//  MatchMe
//
//  Created by David on 4/2/15.
//  Copyright (c) 2015 David Fry. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController
{

    let frontCardTopMargin: CGFloat = 0.0
    let backCardTopMargin: CGFloat = 10
    
    var backCard: SwipeView?
    var frontCard: SwipeView?
    
    @IBOutlet weak var cardStackView: UIView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.cardStackView.backgroundColor = UIColor.clearColor()
        
        self.backCard = SwipeView(frame: self.createCardFrame(self.backCardTopMargin))
        self.cardStackView.addSubview(self.backCard!)
        
        self.frontCard = SwipeView(frame: self.createCardFrame(self.frontCardTopMargin))
        self.cardStackView.addSubview(self.frontCard!)
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect
    {
        return CGRect(x: 0, y: topMargin, width: self.cardStackView.frame.width, height: self.cardStackView.frame.height)
    }


}
