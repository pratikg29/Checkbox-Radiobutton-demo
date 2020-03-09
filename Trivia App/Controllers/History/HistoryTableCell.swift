//
//  HistoryTableCell.swift
//  Trivia App
//
//  Created by pratik on 01/01/20.
//  Copyright © 2020 pratik. All rights reserved.
//

import UIKit

class HistoryTableCell: UITableViewCell {

    @IBOutlet weak var lblGameNumber: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblQueFirst: UILabel!
    @IBOutlet weak var lblAnsFirst: UILabel!
    @IBOutlet weak var lblQueSecond: UILabel!
    @IBOutlet weak var lblAnsSecond: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    // configure cell UI
    func configureCell(game: Game) {
        self.lblGameNumber.text = "Game \(game.id)"
        let df = DateFormatter()
        df.dateFormat = "dd'th' MMM hh:mm a"
        let time = df.string(from: game.time)
        self.lblTime.text = time
        self.lblPlayerName.text = game.name
        self.lblQueFirst.text = game.questios.first?.question
        self.lblAnsFirst.text = game.questios.first?.answer
        self.lblQueSecond.text = game.questios.last?.question
        self.lblAnsSecond.text = game.questios.last?.answer
    }
    
}
