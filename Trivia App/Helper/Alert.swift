//
//  Alert.swift
//  Trivia App
//
//  Created by pratik on 01/01/20.
//  Copyright © 2020 pratik. All rights reserved.
//

import Foundation
import UIKit


class Alert {
    
    static func showAlert(vc: UIViewController, message:String) -> Void {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
