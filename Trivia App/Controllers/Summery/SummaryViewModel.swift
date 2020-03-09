//
//  SummaryViewModel.swift
//  Trivia App
//
//  Created by pratik on 01/01/20.
//  Copyright © 2020 pratik. All rights reserved.
//

import Foundation
import RealmSwift

class SummaryViewModel: NSObject {
    
    // get specific record from database
    var game: Game? {
        let realm = try! Realm()
        return realm.object(ofType: Game.self, forPrimaryKey: currentGameNumber)
    }
    
}
