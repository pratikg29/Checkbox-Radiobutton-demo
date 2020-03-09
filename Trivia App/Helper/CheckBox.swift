//
//  CheckBox.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    // Images for both states
    let checkedImage = UIImage(named: "ic_check")! as UIImage
    let uncheckedImage = UIImage(named: "ic_uncheck")! as UIImage
    

    // Bool property (checked or not)
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.isSelected = true
            } else {
                self.isSelected = false
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
        self.isSelected = false
        // set different images for both state
        self.setImage(checkedImage, for: .selected)
        self.setImage(uncheckedImage, for: .normal)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            sender.tapAnimation {       // just a button press animation
                
            }
            isChecked = !isChecked
        }
    }
}


extension UIButton {
    //MARK:- Animate button click
    
    open override func draw(_ rect: CGRect) {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.8
        self.layer.cornerRadius = 10
    }
    
    func tapAnimation(closure: @escaping () -> Void){
        guard let image = self.imageView else {return}

        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                
                closure()
                image.transform = .identity
            }, completion: nil)
        }
    }
}
