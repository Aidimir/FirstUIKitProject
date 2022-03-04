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
    var scrollView : UIScrollView = UIScrollView()
    var cards = [ProductCard]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        setup(scrollView: scrollView)
        FirebaseData().getData { dict in
            self.scrollView = CapaciousScrollView(frame: .zero, groups: dict)
            self.view.addSubview(self.scrollView)
            self.setup(scrollView: self.scrollView)
            self.scrollView.reloadInputViews()
        }
        title = "Products"
    }
    func setup(scrollView : UIView){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}
