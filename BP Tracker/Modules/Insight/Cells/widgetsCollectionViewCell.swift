// widgetsCollectionViewCell.swift
// BP Tracker
// Created by user on 6/7/24.

import UIKit

class widgetsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var lbl_widgets: UILabel!
    @IBOutlet var sec_mainview: UIView!
    @IBOutlet var mainview_widgets: UIView!
    @IBOutlet var img_view: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sec_mainview.layer.borderColor = UIColor.red.cgColor
        sec_mainview.layer.borderWidth = 1
        sec_mainview.applyShadow()
    }
}
