//
//  cart_controller.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 01.03.2022.
//

import Foundation
import UIKit
import SwiftUI

class CartController : UIViewController{
    static var test = [ProductCard]()
    override func viewDidLoad() {
        let tableView = TableView(frame: .zero , products: CartController.test)
        view.addSubview(tableView)
        setup(tableView: tableView)
        title = "Cart"
    }
    func setup(tableView : UITableView){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                 tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                 tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                 tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                 tableView.heightAnchor.constraint(equalTo: view.heightAnchor)])
    }
}
