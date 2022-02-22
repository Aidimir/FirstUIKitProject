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
            var dictionary : Dictionary<String,Array<ProductCard>> = [:]
            for i in allGroups{
                dictionary[i] = []
            }
            for (key,value) in dict{
                let destinationPage = UIHostingController(rootView: Page(images: [Image(systemName: "leaf.fill")], mainImage: Image(systemName: "leaf"), productName: value["name"] as! String, description: value["description"] as! String, price: value["price"] as! Int))
                dictionary[value["group"] as! String]!.append(ProductCard(name: value["name"] as! String, image: UIImage(systemName: "leaf")!, shortdescription: value["description"] as! String, frame: .zero, destinationPage: destinationPage))
            }
            completionHandler(dictionary)
        }
    }
}

//import Foundation
//import Firebase
//import FirebaseDatabase
//import FirebaseStorage
//import Kingfisher
//import UIKit
//import SwiftUI
//
//class FirebaseData{
//    let database = Firestore.firestore()
//    func getData(_ completionHandler : @escaping (Array<ProductCard>)-> Void){
//        let docRef = database.document("Products/products_data")
//        docRef.getDocument { data, error in
//            guard let data = data?.data() , error == nil else{
//                return
//            }
//            var dict = data as! [String:[String:Any]]
//            var array : Array<ProductCard> = []
//            for (key,value) in dict{
//                let destinationPage = UIHostingController(rootView: Page(images: [Image(systemName: "leaf.fill")], mainImage: Image(systemName: "leaf"), productName: value["name"] as! String, description: value["description"] as! String, price: value["price"] as! Int))
//                array.append(ProductCard(name: value["name"] as! String, image: UIImage(systemName: "leaf")!, shortdescription: value["description"] as! String, frame: .zero, destinationPage: destinationPage))
//            }
//            completionHandler(array)
//        }
//    }
//}
