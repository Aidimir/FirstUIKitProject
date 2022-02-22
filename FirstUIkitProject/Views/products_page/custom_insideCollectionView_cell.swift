//
//  custom_collectionView_cell.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 22.02.2022.
//

import Foundation
import UIKit

class CustomInsideCell : UICollectionViewCell {
    func setup(name : String, discription : String, image : UIImage, destinationPage : UIViewController){
        let bg = ProductCard(name: name, image: image, shortdescription: discription, frame: .zero, destinationPage: destinationPage)
        contentView.addSubview(bg)
        bg.translatesAutoresizingMaskIntoConstraints = false
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}


