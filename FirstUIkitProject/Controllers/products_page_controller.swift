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
    var cards = [ProductCard]()
    override func viewDidLoad() {
        let filler : UIView = {
            var filler = UIView()
            let imgView = UIImageView(image: UIImage(systemName: "clock.circle")!)
            imgView.contentMode = .scaleAspectFit
            filler.addSubview(imgView)
            filler.backgroundColor = .white
            setup(scrollView: imgView, view: filler)
            return filler
        }()
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(filler)
        setup(scrollView: filler, view: view)
            if allProductsByGroups.isEmpty{
        FirebaseData().getData { dict in
            var scrollView = CapaciousScrollView(frame: .zero, groups: dict)
            self.view.addSubview(scrollView)
            self.setup(scrollView: scrollView,view: self.view)
            allProducts = getAllProudctInOneDict(dict: dict)
            filler.removeFromSuperview()
        }
            }
            else{
                var scrollView = CapaciousScrollView(frame: .zero, groups: allProductsByGroups)
                self.view.addSubview(scrollView)
                self.setup(scrollView: scrollView,view: self.view)
                allProducts = getAllProudctInOneDict(dict: allProductsByGroups)
                filler.removeFromSuperview()
            }
        title = "Products"
    }
    func setup(scrollView : UIView , view : UIView ){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
