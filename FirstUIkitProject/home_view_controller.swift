//
//  HomeViewController.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 02.02.2022.
//

import Foundation
import UIKit
var imgArray = [UIImageView(image:  UIImage(systemName: "leaf.fill")!),UIImageView(image:  UIImage(systemName: "leaf")!),UIImageView(image:  UIImage(systemName: "leaf")!),UIImageView(image:  UIImage(systemName: "leaf")!),UIImageView(image:  UIImage(systemName: "leaf")!)]
class HomeViewController : UIViewController, UIScrollViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let img =  UIImage(named: "crypto")!
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imgView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        title = "Home"
        let a = MainScrollSells(sellsArray: imgArray)
        a.delegate = self
        a.backgroundColor = .white
        view.addSubview(a)
        a.translatesAutoresizingMaskIntoConstraints = false
        a.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        a.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        a.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        a.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        a.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
}
