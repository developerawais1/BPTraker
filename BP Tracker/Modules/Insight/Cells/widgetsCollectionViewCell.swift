//
//  widgetsCollectionViewCell.swift
//  BP Tracker
//
//  Created by user on 6/8/24.
//

import UIKit

class widgetsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var lbl_widgets: UILabel!
    @IBOutlet var secMainView: UIView!
    @IBOutlet var mainView_widgets: UIView!
    @IBOutlet var img_widgets: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView_widgets.layer.borderColor = UIColor.red.cgColor
        mainView_widgets.layer.borderWidth = 1
        
        secMainView.applyShadow()
        
    }
    
}
