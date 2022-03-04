//
//  scrollview.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 25.02.2022.
//

import Foundation
import UIKit

class CapaciousScrollView : UIScrollView,UIScrollViewDelegate{
    var groups : Dictionary<String,Array<ProductCard>>
    let view : UIView = UIView()
    let scrollView : UIScrollView = UIScrollView()
    let stackView : UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    func setup(){
        let a = createCollections(groups: groups)
        for i in a{
            stackView.addArrangedSubview(i)
        }
        scrollView.isPagingEnabled = true
        view.addSubview(stackView)
        attachTo(what: stackView, toWhat: view,multiplyPages: 1)
        scrollView.addSubview(view)
        attachTo(what: view, toWhat: scrollView, multiplyPages: groups.count)
        addSubview(scrollView)
        attachTo(what: scrollView, toWhat: self, multiplyPages: 1)
    }
    func attachTo(what : UIView, toWhat : UIView, multiplyPages : Int){
        what.translatesAutoresizingMaskIntoConstraints = false
        what.topAnchor.constraint(equalTo: toWhat.topAnchor).isActive = true
        what.bottomAnchor.constraint(equalTo: toWhat.bottomAnchor).isActive = true
        what.leftAnchor.constraint(equalTo: toWhat.leftAnchor).isActive = true
        what.rightAnchor.constraint(equalTo: toWhat.rightAnchor).isActive = true
        what.heightAnchor.constraint(equalTo: toWhat.heightAnchor).isActive = true
        what.widthAnchor.constraint(equalTo: toWhat.widthAnchor,multiplier: CGFloat(multiplyPages)).isActive = true
    }
    init(frame: CGRect, groups : Dictionary<String,Array<ProductCard>>){
        self.groups = groups
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
func createCollections(groups : Dictionary<String,Array<ProductCard>>)-> Array<InsideCollectionView>{
    var collections = [InsideCollectionView]()
    for (key,value) in groups.sorted{$0.0<$1.0}{
        var i = InsideCollectionView(frame: .zero, cards: value, name: key)
        collections.append(i)
        print(key,value.count)
    }
    return collections
}
