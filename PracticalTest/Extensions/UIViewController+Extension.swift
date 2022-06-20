//
//  UIViewController+Extension.swift
//  PracticalTest
//
//  Created by raviseta on 20/06/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String? = "App name", message: String?) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
        })
        
        dialogMessage.addAction(ok)
        DispatchQueue.main.async {
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
}
