//
//  UIPageControl+Extension.swift
//  BP Tracker
//
//  Created by Developer Awais on 05/05/2024.
//

import UIKit
//MARK: - Extension PageControl
extension UIPageControl {
    func updateIndicatorImages() {
        for index in 0..<numberOfPages {
            let indicatorImage = (index == currentPage) ? ImageHelper.pageSelected : ImageHelper.page
            setIndicatorImage(indicatorImage, forPage: index)
        }
    }
}
