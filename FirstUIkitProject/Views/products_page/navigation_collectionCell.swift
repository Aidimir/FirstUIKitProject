//
//  navigation_collectionCell.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 27.02.2022.
//

import Foundation
import UIKit

class NavigationCell : UICollectionReusableView{
    let name : String
    func setup(name: String){
        let label = UILabel()
        label.text = name
        addSubview(label)
    }
    init(frame : CGRect, name : String){
        self.name = name
        super.init(frame: .zero)
        setup(name: name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
