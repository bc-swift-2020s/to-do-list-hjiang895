//
//  UIViewController+alert.swift
//  To Do List
//
//  Created by Hannah Jiang on 4/9/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import UIKit

extension UIViewController {
    func oneButtonAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
       self.present(alertController, animated: true, completion: nil)
    }
}
