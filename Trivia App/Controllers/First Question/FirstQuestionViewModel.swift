//
//  FirstQuestionViewModel.swift
//  Trivia App
//
//  Created by pratik on 01/01/20.
//  Copyright © 2020 pratik. All rights reserved.
//

import Foundation
import RealmSwift

class FirstQuestionViewModel: NSObject {
    
    let realm = try! Realm()
    
    func saveQuestion(question: String, answer: String, completion: (Bool) -> Void) {
        
        if answer == "" {
            completion(false)
            return
        }
        
        let game = realm.object(ofType: Game.self, forPrimaryKey: currentGameNumber)
        
        if game != nil {
            try! realm.write {
                let que = Question()
                que.question = question
                que.answer = answer
                
                game?.questios.append(que)
                completion(true)
            }
        }
    }
    
}
