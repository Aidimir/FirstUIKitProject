//
//  firebase_data.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 16.02.2022.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import Kingfisher
import UIKit
import SwiftUI

class FirebaseData{
    let database = Firestore.firestore()
    func getData(_ completionHandler : @escaping (Dictionary<String,Array<ProductCard>>)-> Void){
        let docRef = database.document("Products/products_data")
        docRef.getDocument { data, error in
            guard let data = data?.data() , error == nil else{
                return
            }
            var dict = data as! [String:[String:Any]]
            var array : Array<ProductCard> = []
            var allGroups = [String]()
            for (key,value) in dict{
                if !allGroups.contains(value["group"] as! String){
                    allGroups.append(value["group"] as! String)
                }
            }
            allGroups.sort()
            allGroups.append("all")
            var dictionary : Dictionary<String,Array<ProductCard>> = [:]
            for i in allGroups{
                dictionary[i] = []
            }
            for (key,value) in dict{
                var imageView = UIImageView()
                imageView.kf.setImage(with: URL(string: "https://w0.peakpx.com/wallpaper/51/52/HD-wallpaper-apex-legend-crypto-neon.jpg"))
                let destinationPage = UIHostingController(rootView: Page(images: [ Image(uiImage : UIImage(systemName: "leaf")!)], mainImage: Image(uiImage : UIImage(systemName: "leaf")!), productName: value["name"] as! String, description: value["description"] as! String, price: value["price"] as! Int))
                dictionary[value["group"] as! String]!.append(ProductCard(name: value["name"] as! String, image: UIImage(systemName: "leaf")!, shortdescription: value["description"] as! String, frame: .zero, destinationPage: destinationPage , price: value["price"] as! Int))
                dictionary["all"]!.append(ProductCard(name: value["name"] as! String, image: UIImage(systemName: "leaf")!, shortdescription: value["description"] as! String, frame: .zero, destinationPage: destinationPage , price: value["price"] as! Int))
            }
            completionHandler(dictionary)
        }
    }
}
