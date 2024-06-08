//
//  InsightCollectionViewCell.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 22/04/2024.
//

import UIKit

class InsightCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var insightImage: UIImageView!
    @IBOutlet weak var insightNameLbl: UILabel!
    @IBOutlet weak var insightCount: UILabel!
    
    @IBOutlet var firstMainView: UIView!
    @IBOutlet var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.applyShadow()
       firstMainView.applyShadow()
       
    }
    
}
