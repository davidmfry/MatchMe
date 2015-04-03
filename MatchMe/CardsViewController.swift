//
//  CardsViewController.swift
//  MatchMe
//
//  Created by David on 4/2/15.
//  Copyright (c) 2015 David Fry. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, SwipeViewDelegate
{

    struct Card
    {
        let cardView: CardView
        let swipeView: SwipeView
    }
    
    let frontCardTopMargin: CGFloat = 0.0
    let backCardTopMargin: CGFloat = 10
    
    var backCard: Card?
    var frontCard: Card?
    
    @IBOutlet weak var cardStackView: UIView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.cardStackView.backgroundColor = UIColor.clearColor()
        
        self.backCard = self.createCard(self.backCardTopMargin)
        self.cardStackView.addSubview(self.backCard!.swipeView)
        
        self.frontCard = self.createCard(self.frontCardTopMargin)
        self.cardStackView.addSubview(self.frontCard!.swipeView)
    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect
    {
        return CGRect(x: 0, y: topMargin, width: self.cardStackView.frame.width, height: self.cardStackView.frame.height)
    }
    
    private func createCard(topMargin: CGFloat) -> Card
    {
        // Creates instances of CardView and SwipeView
        let cardView = CardView()
        let swipeView = SwipeView(frame: self.createCardFrame(topMargin))
        
        // Add the delegate
        swipeView.delegate = self
        
        // Set the card instance of SwipeView to the cardView
        swipeView.innerView = cardView

        // Return the New Card Struct
        return Card(cardView: cardView, swipeView: swipeView)
        
    }
    
// MARK: SwipeViewDelegate
    func swipedLeft()
    {
        println("left")
        if let fCard = self.frontCard
        {
            fCard.swipeView.removeFromSuperview()
        }
    }
    
    func swipedRight()
    {
        println("right")
        if let fCard = self.frontCard
        {
            fCard.swipeView.removeFromSuperview()
        }
    }
    
    


}
