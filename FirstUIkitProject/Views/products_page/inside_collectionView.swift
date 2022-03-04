//
//  inside_collectionView.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 22.02.2022.
//

import Foundation
import UIKit
class InsideCollectionView : UICollectionView {
    var cards : Array<ProductCard>
    var name : String
    let collection : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomInsideCell.self, forCellWithReuseIdentifier: "cell")
        layout.scrollDirection = .vertical
    return collection
    }()
    let nameView : UILabel = {
        let nameView = UILabel()
        nameView.textColor = .black
        return nameView
    }()
    func setup(){
        collection.delegate = self
        collection.dataSource = self
        nameView.text = self.name
        nameView.textColor = .black
        nameView.textAlignment = .center
        nameView.font = .boldSystemFont(ofSize: 30)
        collection.addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: collection.safeAreaLayoutGuide.topAnchor).isActive = true
        nameView.centerXAnchor.constraint(equalTo: collection.centerXAnchor).isActive = true
        nameView.heightAnchor.constraint(equalTo: collection.heightAnchor, multiplier: 1/10).isActive = true
        nameView.widthAnchor.constraint(equalTo: collection.widthAnchor).isActive = true
        addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collection.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collection.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        collection.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 1).isActive = true
    }

    init(frame : CGRect,cards : Array<ProductCard>, name : String){
        self.cards = cards
        self.name = name
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InsideCollectionView : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.3, height: collectionView.frame.height/2.5)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomInsideCell
        var sortedCards = cards.sorted{
            $0.name < $1.name
        }
        cell.setup(view: sortedCards[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = NavigationCell(frame: .zero, name: name)
        return cell
    }
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        scrollView.reloadInputViews()
    }
}

