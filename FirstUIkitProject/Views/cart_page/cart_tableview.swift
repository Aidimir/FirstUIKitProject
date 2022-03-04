//
//  cart_tableview.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 01.03.2022.
//

import Foundation
import UIKit

class TableView : UITableView, UITableViewDataSource, UITableViewDelegate {
    var products : Array<ProductCard>
    let tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = Header().setup(headerText: "Cart")
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/10
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.setup(card: products[indexPath.item])
        return cell
    }
    func setup(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     tableView.leftAnchor.constraint(equalTo: leftAnchor),
                                     tableView.rightAnchor.constraint(equalTo: rightAnchor),
                                     tableView.widthAnchor.constraint(equalTo: widthAnchor),
                                     tableView.heightAnchor.constraint(equalTo: heightAnchor)])
    }
    init(frame : CGRect, products : Array<ProductCard>){
        self.products = products
        super.init(frame: .zero, style: .insetGrouped)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
