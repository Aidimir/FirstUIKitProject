//
//  custom_collectionView_cell.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 22.02.2022.
//

import Foundation
import UIKit

class CustomInsideCell : UICollectionViewCell {
    func setup(view : ProductCard){
        let bg = view
        bg.frame = contentView.bounds
        bg.layer.shadowColor = UIColor.black.cgColor
        bg.layer.shadowOpacity = 0.1
        bg.layer.shadowRadius = 20
        bg.layer.shouldRasterize = true
        bg.layer.rasterizationScale = UIScreen.main.scale
        bg.layer.shadowPath = UIBezierPath(rect: bg.bounds).cgPath
        contentView.addSubview(bg)
    }
}


