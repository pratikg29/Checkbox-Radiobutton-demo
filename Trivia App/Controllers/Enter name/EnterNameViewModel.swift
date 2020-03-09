//
//  EnterNameViewModel.swift
//  Trivia App
//
//  Created by pratik on 01/01/20.
//  Copyright © 2020 pratik. All rights reserved.
//

import Foundation
import RealmSwift

class EnterNameViewModel: NSObject {
    
    let realm = try! Realm()        // Realm instance
    
    
    // save user's name for current game
    func saveName(name:String, completion: (Bool) -> Void) {
        
        if name == "" {
            completion(false)
            return
        }
        
        let game = realm.object(ofType: Game.self, forPrimaryKey: currentGameNumber)
        
        if game != nil {
            try! realm.write {
                game!.name = name
                completion(true)
            }
        }
    }
}

