//
//  cart_tableview.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 01.03.2022.
//

import Foundation
import UIKit

class TableView : UITableView, UITableViewDataSource, UITableViewDelegate {
    let tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = Header().setup(headerText: "Cart")
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/10
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.setup(card: cart[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            cart.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect(productName: cart[indexPath.row].name)
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
    init(frame : CGRect){
        super.init(frame: .zero, style: .insetGrouped)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func loadList(notification: NSNotification){
        //load data her
        tableView.reloadData()
    }
    func didSelect(productName : String){
        let controller = getCurrentViewController()
        let thePage = allProducts[productName]
        controller?.present(thePage!.destinationPage, animated: true, completion: nil)
    }
}
