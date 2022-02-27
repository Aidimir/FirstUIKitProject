//
//  shit.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 23.02.2022.
//

import Foundation
import UIKit
func getAllValuesInOneArray(dict : Dictionary<String,Array<ProductCard>>)-> Array<ProductCard>{
    var res = [ProductCard]()
    for (key,value) in dict{
        for i in value{
            res.append(i)
        }
    }
    return res 
}
