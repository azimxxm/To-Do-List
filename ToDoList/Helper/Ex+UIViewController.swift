//
//  Ex+UIViewController.swift
//  ToDoList
//
//  Created by Azimjon Abdurasulov on 08/11/22.
//

import UIKit

extension UIViewController {
    func showAlert(_ title: String?, _ message: String?, _ alertPreferredStyle: UIAlertController.Style, alertAction: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertPreferredStyle)
        alert.addAction(alertAction)

        DispatchQueue.main.async {
            self.present(alert, animated: false, completion: nil)
        }
    }
}
