//
//  CornerRadius.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 18/04/2024.
//

import Foundation
import UIKit

extension UIView {
    
  @IBInspectable  var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
