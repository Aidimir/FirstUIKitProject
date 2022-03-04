//
//  product_card.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 22.01.2022.
//

import Foundation
import UIKit
import SwiftUI

class ProductCard : UIView {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    var name : String
    var image : UIImage
    var shortDescription : String
    var destinationPage : UIViewController
    var price : Int
    init(name : String, image : UIImage, shortdescription : String,frame : CGRect, destinationPage : UIViewController , price : Int){
        self.name = name
        self.image = image
        self.shortDescription = shortdescription
        self.destinationPage = destinationPage
        self.price = price
        super.init(frame: .zero)
        setup(image: image, name: name, shortDescription: shortDescription, destinationPage: destinationPage , price : price)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image : UIImage, name : String, shortDescription : String, destinationPage : UIViewController , price : Int){

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        let nameView = UILabel()
        nameView.text = name
        nameView.font = UIFont.boldSystemFont(ofSize: 30)
        nameView.textColor = .black
        let priceView = UILabel()
        priceView.text = "\(price) RUB"
        priceView.textColor = .black
        priceView.font = .boldSystemFont(ofSize: 35)
        let descriptionView = UILabel()
        descriptionView.text = shortDescription
        descriptionView.font = UIFont.systemFont(ofSize: 25)
        descriptionView.textColor = .black
        let stack = UIStackView()
        stack.spacing = 5
        stack.axis = .vertical
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(priceView)
        stack.addArrangedSubview(nameView)
        stack.addArrangedSubview(descriptionView)
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        let button = createButton(destinationPage: destinationPage)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: stack.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: stack.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: stack.rightAnchor).isActive = true

    }
    func createButton(destinationPage : UIViewController)-> UIButton{
        let button = UIButton()
        button.addTarget(self, action: #selector(onTap) , for: .touchUpInside)
        return button
    }
    @objc func onTap(){
        let controller = getCurrentViewController()
        controller?.present(destinationPage, animated: false, completion: nil)
    }
}


func getCurrentViewController() -> UIViewController? {

   if let rootController = UIApplication.shared.keyWindow?.rootViewController {
       var currentController: UIViewController! = rootController
       while( currentController.presentedViewController != nil ) {
           currentController = currentController.presentedViewController
       }
       return currentController
   }
   return nil

}
