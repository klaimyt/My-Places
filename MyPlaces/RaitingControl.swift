//
//  RaitingControl.swift
//  MyPlaces
//
//  Created by Иван Клименков on 15/12/2019.
//  Copyright © 2019 Ivan klimenkov. All rights reserved.
//

import UIKit

@IBDesignable class RaitingControl: UIStackView {
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStat()
        }
    }
    
    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButton()
        }
    }
    
    

   // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    // MARK: Button action
    
    @objc func ratingButtonTapped(button: UIButton) {
            
        guard  let index = ratingButtons.firstIndex(of: button) else { return }
        
        // Calculate the raiting of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    // MARK: Private Methods
    private func setupButton() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        // Load button image
        let bundle = Bundle(for: type(of: self))
        
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        
        let highlitedStar = UIImage(named: "highlitedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            
            
            // Set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlitedStar, for: .highlighted)
            button.setImage(highlitedStar, for: [.highlighted, .selected])
            
            // Add constrains
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add button to the stack
            addArrangedSubview(button)
            
            // Add the new button on the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStat()
    }
    
    private func updateButtonSelectionStat() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }

}
