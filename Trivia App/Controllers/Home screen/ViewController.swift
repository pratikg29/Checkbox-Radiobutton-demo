//
//  ViewController.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import UIKit

var currentGameNumber = 0

class ViewController: UIViewController {

    @IBOutlet weak var btnStart: UIButton!
    
    let viewModel = ViewControllerViewmodel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onBtnStart(_ sender: Any) {
        self.viewModel.startGame {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EnterNameVC") as? EnterNameVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
