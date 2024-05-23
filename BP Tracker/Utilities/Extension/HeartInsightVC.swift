//
//  HeartInsightVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 24/04/2024.
//

import UIKit

class HeartInsightVC: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet var shadowDrop: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowDrop.applyShadow()
        stackView.applyShadow()
    }
}
    extension UIView {
        func applyShadow(cornerRadius: CGFloat = 3,
                         shadowColor: UIColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0),
                         shadowOffset: CGSize = CGSize(width: 0, height: 1.75),
                         shadowRadius: CGFloat = 1.8,
                         shadowOpacity: Float = 0.45) {
            
          //  self.layer.cornerRadius = cornerRadius
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowOpacity = shadowOpacity
        }
    }

