//
//  homePage_cell.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 08.04.2022.
//

import Foundation
import UIKit
class CustomHomeCell : UICollectionViewCell {
    func setup(view : ProductCard){
        let bg = view
        bg.frame = contentView.frame
        contentView.addSubview(bg)
    }
}

