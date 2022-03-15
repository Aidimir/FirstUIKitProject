//
//  firebase_data.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 16.02.2022.
//

import Foundation
import Firebase
import Kingfisher
import UIKit
import SwiftUI
import YandexMapsMobile

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
            for (_,value) in dict{
                var uiImages = [UIImage]()
                if value["images"] != nil{
                for i in value["images"] as! Array<String>{
                    let image = try? UIImage(data: Data(contentsOf: URL(string: i)!))  ?? UIImage(systemName: "image")
                    uiImages.append(image!)
                }
                }
                if uiImages.isEmpty{
                    uiImages.append(UIImage(systemName: "photo")!)
                }
                let productName = value["name"] as! String
                let price = value["price"] as! Int
                var images = [Image]()
                for i in uiImages{
                    images.append(Image(uiImage: i))
                }
                let destinationPage = UIHostingController(rootView: Page(images: images, mainImg: uiImages[0] , productName: productName, description: value["description"] as! String, price: price))
                let shortdescription = value["description"] as! String
                dictionary[value["group"] as! String]!.append(ProductCard(name: productName, image: uiImages[0], shortdescription: shortdescription, frame: .zero, destinationPage: destinationPage , price: price))
                dictionary["all"]!.append(ProductCard(name: value["name"] as! String, image: uiImages[0], shortdescription: shortdescription, frame: .zero, destinationPage: destinationPage , price: price))
            }
            completionHandler(dictionary)
        }
    }
    func getPoints(_ completionHandler : @escaping ([Point])->Void){
        let docRef = database.document("MarksOnMap/marks")
        docRef.getDocument { data, error in
            guard let data = data?.data(), error == nil else{ return }
            let dict = data as! [String: [String:Any]]
            var res = [Point]()
            for (_,value) in dict{
                var name = value["name"] as! String
                var description = value["description"] as! String
                var worktime = value["worktime"] as! String
                var mapPoint = value["coordinates"] as! GeoPoint
                res.append(Point(name: name, description: description, worktime: worktime, pointOnMap: YMKPoint(latitude: mapPoint.latitude, longitude: mapPoint.longitude)))
            }
            completionHandler(res)
        }

    }
}
