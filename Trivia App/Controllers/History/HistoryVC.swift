//
//  HistoryVC.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    let viewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onBtnHome(_ sender: Any) {
        // Go back to home screen
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.gameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableCell
        // configure cell in cell class directly
        cell.configureCell(game: viewModel.gameList[indexPath.row])
        return cell
    }
}
