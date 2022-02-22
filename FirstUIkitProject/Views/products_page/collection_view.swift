//
//  collection_view.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 22.02.2022.
//

import Foundation
import UIKit

class CreateCapaciousCollection : UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    
    var groups : Dictionary<String,Array<ProductCard>>
    
    func createCollection(groups : Dictionary<String,Array<ProductCard>>) -> UICollectionView{
        let collectionView : UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collection = UICollectionView()
            collection.isPagingEnabled = true
            collection.numberOfItems(inSection: groups.count+1)
            collection.register(CustomCell.self, forCellWithReuseIdentifier: "Custom cell")
            return collection
        }()
        return collectionView
    }
    func setup(collectionView : UICollectionView){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom cell", for: indexPath) as! CustomCell
        var values = convertValuesToArray(dict: groups)
        cell.setup(collectionView: InsideCollectionView(frame: .zero, cards: values[indexPath.item] ))
        return cell
    }
    
    init(frame : CGRect,groups : Dictionary<String,Array<ProductCard>>){
        self.groups = groups

        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        var collectionView = createCollection(groups: groups)
        addSubview(collectionView)
        setup(collectionView: collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func convertValuesToArray(dict : Dictionary<String,Array<ProductCard>>)-> Array<Array<ProductCard>>{
        var values = [Array<ProductCard>]()
        for (key,value) in dict{
            values.append(value as! Array<ProductCard>)
        }
        var allArrayValues = [Array<ProductCard>]()
        for i in values{
            for j in values{
                allArrayValues.append(j)
            }
        }
        var buf = [ProductCard]()
        buf = values.last!
        for i in (0..<values.count-1){
            values[i] = values[i+1]
        }
        values[0] = buf
        return values
    }
}

