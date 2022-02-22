//
//  productCardsPage.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 02.02.2022.
//
import Foundation
import UIKit
import SwiftUI


class ProductsPageController : UIViewController {
    var collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var cards = [ProductCard]()
        override func viewDidLoad() {
        super.viewDidLoad()
            view.addSubview(collectionView)
            setup(collectionView: collectionView)
        FirebaseData().getData { dict in
            var array : Array<ProductCard> = []
            for (key,value) in dict{
                for i in value{
                    array.append(i)
                }
            }
            self.cards = array
            self.cards.sort{
                $0.name < $1.name
            }
            DispatchQueue.main.async {
                self.collectionView = InsideCollectionView(frame: .zero, cards: self.cards)
                self.view.addSubview(self.collectionView)
                self.setup(collectionView: self.collectionView)
            }
            }
        title = "Products"
    }
    func setup(collectionView : UIView){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}
