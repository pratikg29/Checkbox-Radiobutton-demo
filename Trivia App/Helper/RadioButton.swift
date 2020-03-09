//
//  RadioButton.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import Foundation
import UIKit

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    
    // images for both states
    let selectedImage = UIImage(named: "ic_radio_selected")! as UIImage
    let unselectedImage = UIImage(named: "ic_radio_unselected")! as UIImage
    
    override func awakeFromNib() {
        self.setImage(unselectedImage, for: .normal)        // initially unselected
    }
    
    // unselect other buttons
    func unselectAlternateButtons(){
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        }else{
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tapAnimation {     // tap animation
            
        }
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton(){
        self.isSelected = !isSelected
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.setImage(selectedImage, for: .normal)
            } else {
                self.setImage(unselectedImage, for: .normal)
            }
        }
    }
}
