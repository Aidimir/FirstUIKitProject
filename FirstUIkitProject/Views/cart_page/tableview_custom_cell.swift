//
//  tableview_custom_cell.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 01.03.2022.
//

import Foundation
import UIKit

class TableViewCell : UITableViewCell{
    let hstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    let vstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = stack.frame.height/10
        stack.distribution = .fillEqually
        return stack
    }()
    let imgView : UIImageView = {
        let imgView = UIImageView(image : UIImage())
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    let nameView : UILabel = {
        let nameView = UILabel()
        nameView.font = .boldSystemFont(ofSize: 30)
        nameView.textColor = .black
        return nameView
    }()
    let discriptionView : UILabel = {
        let nameView = UILabel()
        nameView.font = .boldSystemFont(ofSize: 25)
        nameView.textColor = .black
        return nameView
    }()
    let priceView : UILabel = {
        let nameView = UILabel()
        nameView.font = .boldSystemFont(ofSize: 30)
        nameView.textColor = .black
        return nameView
    }()
    func setup(card : ProductCard){
        imgView.image = card.image
        nameView.text = card.name
        discriptionView.text = card.shortDescription
        priceView.text = String(card.price) + " RUB"
        hstack.addArrangedSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.leftAnchor.constraint(equalTo: hstack.leftAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: hstack.centerYAnchor).isActive = true
        imgView.widthAnchor.constraint(equalTo: hstack.widthAnchor, multiplier: 1/5).isActive = true
        imgView.heightAnchor.constraint(equalTo: hstack.heightAnchor).isActive = true
        hstack.addArrangedSubview(vstack)
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.leftAnchor.constraint(equalTo: imgView.rightAnchor).isActive = true
        vstack.centerYAnchor.constraint(equalTo: imgView.centerYAnchor).isActive = true
        vstack.widthAnchor.constraint(equalTo: hstack.widthAnchor, multiplier: 2.4/5).isActive = true
        vstack.heightAnchor.constraint(equalTo: hstack.heightAnchor).isActive = true
        vstack.addArrangedSubview(nameView)
        vstack.addArrangedSubview(discriptionView)
        hstack.addArrangedSubview(priceView)
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.leftAnchor.constraint(equalTo: vstack.rightAnchor).isActive = true
        priceView.centerYAnchor.constraint(equalTo: vstack.centerYAnchor).isActive = true
        priceView.widthAnchor.constraint(equalTo: hstack.widthAnchor, multiplier: 1.6/5).isActive = true
        priceView.heightAnchor.constraint(equalTo: hstack.heightAnchor).isActive = true
        vstack.frame = contentView.bounds
        addSubview(hstack)
        hstack.frame = contentView.bounds
    }

}
