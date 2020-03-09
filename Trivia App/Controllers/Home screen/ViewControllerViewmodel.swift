//
//  ViewControllerViewmodel.swift
//  Trivia App
//
//  Created by pratik on 01/01/20.
//  Copyright © 2020 pratik. All rights reserved.
//

import Foundation
import RealmSwift

class ViewControllerViewmodel: NSObject {
    
    // create new record in database for new game
    func startGame(completion: () -> Void) {
        let realm = try! Realm()    // Realm instance
        let game = Game()           // create object of class Game to initialize new game
        game.id = game.IncrementaID()   // set primary key to each record of game
        currentGameNumber = game.IncrementaID()
        
        try! realm.write {
            realm.add(game)
            completion()
        }
    }
}
