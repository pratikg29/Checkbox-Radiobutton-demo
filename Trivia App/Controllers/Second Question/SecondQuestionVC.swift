//
//  SecondQuestion.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import UIKit

class SecondQuestionVC: UIViewController {

    @IBOutlet weak var lblQue: UILabel!
    @IBOutlet weak var btnFirst: CheckBox!
    @IBOutlet weak var btnSecond: CheckBox!
    @IBOutlet weak var btnThird: CheckBox!
    @IBOutlet weak var btnFourth: CheckBox!
    
    @IBOutlet weak var ansFirst: UILabel!
    @IBOutlet weak var ansSecond: UILabel!
    @IBOutlet weak var ansThird: UILabel!
    @IBOutlet weak var ansFourth: UILabel!
    
    let viewModel = SecondQuestionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // collect answer of question
    func getAns() -> String {
        
        var ans = ""
        if btnFirst.isSelected {
            ans.append(ansFirst.text!)
        }
        if btnSecond.isSelected {
            ans.append(", \(ansSecond.text!)")
        }
        if btnThird.isSelected {
            ans.append(", \(ansThird.text!)")
        }
        if btnFourth.isSelected {
            ans.append(", \(ansFourth.text!)")
        }
        return ans
    }
    
    @IBAction func onBtnNext(_ sender: Any) {
        self.viewModel.saveQuestion(question: self.lblQue.text!, answer: self.getAns(), completion: { flag in
            // flag will true if result will be success
            if flag {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SummaryVC") as? SummaryVC
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else {
                Alert.showAlert(vc: self, message: "Please choose answer.")
            }
        })
    }
}
