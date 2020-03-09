//
//  EnterNameVC.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import UIKit

class EnterNameVC: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    let viewModel = EnterNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onBtnNext(_ sender: Any) {
        
        self.viewModel.saveName(name: txtName.text!) { flag in
            // flag will true if result will be success
            if flag {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirstQuestionVC") as? FirstQuestionVC
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else {
                Alert.showAlert(vc: self, message: "Enter your name.")
            }
        }
    }
}

extension EnterNameVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
