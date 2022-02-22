//
//  custom_collectionView_cell.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 22.02.2022.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell{
    func setup(collectionView : UICollectionView){
        let cell = collectionView
        contentView.addSubview(cell)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cell.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        cell.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
