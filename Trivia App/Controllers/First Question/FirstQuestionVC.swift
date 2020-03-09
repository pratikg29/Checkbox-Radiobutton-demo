//
//  FirstQuestion.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import UIKit

class FirstQuestionVC: UIViewController {

    @IBOutlet weak var lblQue: UILabel!
    
    @IBOutlet weak var btnFirst: RadioButton!
    @IBOutlet weak var btnSecond: RadioButton!
    @IBOutlet weak var btnThird: RadioButton!
    @IBOutlet weak var btnFourth: RadioButton!
    @IBOutlet weak var ansFirst: UILabel!
    @IBOutlet weak var ansSecond: UILabel!
    @IBOutlet weak var ansThird: UILabel!
    @IBOutlet weak var ansFourth: UILabel!
    
    let viewModel = FirstQuestionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initKit()
    }
    
    // set initial screen setup
    func initKit() {
        self.btnFirst.isSelected = false
        self.btnSecond.isSelected = false
        self.btnThird.isSelected = false
        self.btnFourth.isSelected = false
        
        // set alternet buttons to all radio buttons
        self.btnFirst.alternateButton = [btnSecond,btnThird,btnFourth]
        self.btnSecond.alternateButton = [btnFirst,btnThird,btnFourth]
        self.btnThird.alternateButton = [btnSecond,btnFirst,btnFourth]
        self.btnFourth.alternateButton = [btnSecond,btnThird,btnFirst]
    }
    
    // collect answer of question
    func getAns() -> String {
        
        if btnFirst.isSelected {
            return ansFirst.text!
        }
        if btnSecond.isSelected {
            return ansSecond.text!
        }
        if btnThird.isSelected {
            return ansThird.text!
        }
        if btnFourth.isSelected {
            return ansFourth.text!
        }
        return ""
    }
    
    @IBAction func onBtnNext(_ sender: Any) {
        self.viewModel.saveQuestion(question: self.lblQue.text!, answer: self.getAns(), completion: { flag in
            // flag will true if result will be success
            if flag {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondQuestionVC") as? SecondQuestionVC
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else {
                Alert.showAlert(vc: self, message: "Please choose answer.")
            }
        })
    }
    
}
