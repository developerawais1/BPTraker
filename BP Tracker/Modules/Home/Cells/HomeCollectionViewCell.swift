//
//  HomeCollectionViewCell.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 23/04/2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeCellImage: UIImageView!
    @IBOutlet weak var homeCellNameLbl: UILabel!
    @IBOutlet weak var homeCellCountLbl: UILabel!
    @IBOutlet weak var homeCellLbl: UILabel!
    
    //MARK: - Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
          let circularlayoutAttributes = layoutAttributes as! CircularCollectionViewLayoutAttributes
          self.layer.anchorPoint = circularlayoutAttributes.anchorPoint
          self.center.y += (circularlayoutAttributes.anchorPoint.y - 0.5) * CGRectGetHeight(self.bounds)
    }
}
