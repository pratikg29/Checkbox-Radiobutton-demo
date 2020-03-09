//
//  SummaryVC.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var queFirst: UILabel!
    @IBOutlet weak var ansFirst: UILabel!
    @IBOutlet weak var queSecond: UILabel!
    @IBOutlet weak var ansSecond: UILabel!
    
    let viewModel = SummaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewModel.game != nil {
            // set game summary data which is retrive from database
            self.lblName.text = "Hello \(viewModel.game!.name),"
            self.queFirst.text = viewModel.game!.questios.first?.question
            self.ansFirst.text = viewModel.game!.questios.first?.answer
            self.queSecond.text = viewModel.game!.questios.last?.question
            self.ansSecond.text = viewModel.game!.questios.last?.answer
        }
    }
    
    @IBAction func onBtnFinish(_ sender: Any) {
        
        // go back to home screen
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func onBtnHistory(_ sender: Any) {
        
        // open history screen
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HistoryVC") as? HistoryVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
