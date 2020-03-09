//
//  HistoryViewModel.swift
//  Trivia App
//
//  Created by pratik on 01/01/20.
//  Copyright © 2020 pratik. All rights reserved.
//

import Foundation
import RealmSwift

class HistoryViewModel: NSObject {
    
    // retrive whole database (games list)
    var gameList: Results<Game> {
        let realm = try! Realm()
        return realm.objects(Game.self)
    }
    
}
