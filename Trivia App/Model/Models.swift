//
//  Question.swift
//  Trivia App
//
//  Created by pratik on 31/12/19.
//  Copyright © 2019 pratik. All rights reserved.
//

import Foundation
import RealmSwift


// main game model
class Game: Object {
    @objc dynamic var id = 0
    @objc dynamic var time = Date()
    @objc dynamic var name = ""
    var questios = List<Question>()
    
    override static func primaryKey() -> String? {
        return "id"         // primary key
    }

    //Incrementa ID
    func IncrementaID() -> Int{
        let realm = try! Realm()
        return (realm.objects(Game.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}


// Question model
class Question: Object {
    
    @objc dynamic var question = ""
    @objc dynamic var answer = ""
    
}
