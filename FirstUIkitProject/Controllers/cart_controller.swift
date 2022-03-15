//
//  cart_controller.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 01.03.2022.
//

import Foundation
import UIKit
import StoreKit

class CartController : UIViewController {
    var test = [SKProduct]()
    var tableView = TableView(frame: .zero)
    var label : UILabel = {
    var label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        SKPaymentQueue.default().add(self)
        fetchProducts()
        view.backgroundColor = .white
        view.addSubview(tableView)
        setup(tableView: tableView)
        guard let data = UserDefaults.standard.array(forKey: "cart") as? [String] else { return }
        if allProducts.isEmpty{
            DispatchQueue.main.async {
        FirebaseData().getData { dict in
            var allProductsDict = getAllProudctInOneDict(dict: dict)
            for i in data{
                cart.append(allProductsDict[i]!)
            }
        }
            }
        }
        else{
            for i in data{
                cart.append(allProducts[i]!)
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        var button = createButton(prodCart: cart)
        label.text = "К оплате: \(getPriceForAll(productsInCart: cart)) RUB"
        button.addSubview(label)
        attachTo(what: label, toWhat: button, multiplyPages: 1)
        view.addSubview(button)
        setupButtonView(button: button)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadPriceText), name: NSNotification.Name("reloadPrice"), object: nil)
        title = "Cart"
    }
    @objc func reloadPriceText(notification : NSNotification){
        label.text = "К оплате: \(getPriceForAll(productsInCart: cart)) RUB"
    }
    func setup(tableView : UITableView){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                 tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                 tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                 tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                 tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                 tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)])
    }
    func setupButtonView(button : UIView){
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)])
    }
    func createButton(prodCart : Array<ProductCard>) -> UIView{
        let buttonView = UIView()
        let button : UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
            return button
        }()
        buttonView.backgroundColor = .black
        buttonView.addSubview(button)
        attachTo(what: button, toWhat: buttonView, multiplyPages: 1)
        return buttonView
    }
    @objc func onTap(){
        print("You did tap the PAY button")
        let payment = SKPayment(product: test[0])
        SKPaymentQueue.default().add(payment)
    }
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
func getPriceForAll(productsInCart: Array<ProductCard>) -> Int{
    var summ = 0
    for i in productsInCart{
        summ += i.price
    }
    return summ
}


extension CartController : SKPaymentTransactionObserver, SKProductsRequestDelegate{
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        // none ?
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print(response.products)
        DispatchQueue.main.async {
            self.test = response.products
        }
    }
    func fetchProducts(){
        let request = SKProductsRequest(productIdentifiers: ["com.bandle.test"])
        request.delegate = self
        request.start()
    }
}
