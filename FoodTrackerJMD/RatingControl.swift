//
//  RatingControl.swift
//  FoodTrackerJMD
//
//  Created by Joseph Divalentone on 2/21/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0{
        didSet {
            updateButtonSelectionStates()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    //MARK: Private Methods
    
    private func setupButtons() {
        //clear any old buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        //Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
         let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
         let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        for _ in 0..<starCount{
        //create buttons
        let button = UIButton()
        //set the button images
        button.setImage(emptyStar, for: .normal)
        button.setImage(filledStar, for: .selected)
        button.setImage(highlightedStar, for: .highlighted)
        button.setImage(highlightedStar, for: [.highlighted, .selected])
        
        //Add Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        //setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        //add button to the stack
        addArrangedSubview(button)
            
        ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("Button pressed XD")
        
            guard let index = ratingButtons.index(of: button) else {
                fatalError("The Button, \(button), is not in the ratingButtons array: \(ratingButtons)")
            }
            
        //calc the rating of the selected button
            let selectedRating = index + 1
            
            if selectedRating == rating{
                // if the selected rating is the current rating then reset to 0
                rating = 0
            }else {
                //otherwiseeee set the rating to the selected star
                rating = selectedRating
            }
        }
    
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated(){
            // if the index of a button is less than the rating that one should be selected
            button.isSelected = index < rating
        }
    }
    
    

}
