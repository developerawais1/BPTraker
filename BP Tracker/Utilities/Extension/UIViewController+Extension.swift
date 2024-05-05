//
//  ShowAlert.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 19/04/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String?,
                   message: String?,
                   preferredStyle: UIAlertController.Style = .alert,
                   actions: [UIAlertAction] = [],
                   defaultActionTitle: String? = "OK",
                   completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
            
            actions.forEach { alertController.addAction($0) }
            
            if actions.isEmpty, let defaultActionTitle = defaultActionTitle {
                let okAction = UIAlertAction(title: defaultActionTitle, style: .default, handler: nil)
                alertController.addAction(okAction)
            }
            self.present(alertController, animated: true, completion: completion)
        }
    }
}
