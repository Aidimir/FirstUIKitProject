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
    var dict: Dictionary<String, Array<ProductCard>>?
    
    let spinner = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        view.backgroundColor = .white
        view.addSubview(spinner)
        setup(scrollView: spinner, view: view)
        title = "Products"
        var scrollView = CapaciousScrollView(frame: .zero, groups: dict!)
        self.view.addSubview(scrollView)
        self.setup(scrollView: scrollView,view: self.view)
        allProducts = getAllProudctInOneDict(dict: dict!)
        self.spinner.stopAnimating()
        self.spinner.removeFromSuperview()
    }
    func setup(scrollView : UIView , view : UIView ){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
