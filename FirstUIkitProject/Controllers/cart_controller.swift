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
    var tableView = TableView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setup(tableView: tableView)
        title = "Cart"
    }
    func setup(tableView : UITableView){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                 tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                 tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                 tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                 tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                 tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)])
    }
}
