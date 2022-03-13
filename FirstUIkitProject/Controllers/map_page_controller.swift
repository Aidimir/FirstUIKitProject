//
//  map_page_controller.swift
//  FirstUIkitProject
//
//  Created by Айдимир Магомедов on 09.03.2022.


import Foundation
import UIKit
import YandexMapsMobile
import MapKit

class MapPageController : UIViewController, YMKMapObjectTapListener {
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        NotificationCenter.default.post(name: NSNotification.Name("openSheet"), object: nil)
        return true
    }
    let viewControllerToPresent = BottomSheet()
    let mapView = YMKMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(moveTo), name: NSNotification.Name("moveMap"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onTap), name: NSNotification.Name("openSheet"), object: nil)
        let defaultLocation = YMKPoint(latitude: 56.84173039415533, longitude: 60.65174074759386)
        let mapObjects = mapView.mapWindow.map.mapObjects
        let map = mapView.mapWindow.map
        var style = """
        [
       {
        "tags": {
            "any": ["poi","transit", "polyline"]
       },
       "types": ["point"],
       "stylers": {
       "visibility": "off"       }
       }
       ]
       """
        map.setMapStyleWithStyle(style)
        view.addSubview(mapView)
        setup(map: mapView)
        createButton()
        FirebaseData().getPoints { array in
            for i in array{
                let rect = YMKRect(min: CGPoint(x: 0, y: 0), max: CGPoint(x: 1, y: 1))
                var placeMark = mapObjects.addPlacemark(with: i.pointOnMap, image: UIImage(systemName: "rhombus.fill")!, style: YMKIconStyle(anchor: nil, rotationType: 1, zIndex: nil, flat: 1, visible: 1, scale: 2.5, tappableArea: rect))
                placeMark.addTapListener(with: self)
                
            }
            points = array
            map.move(
                with: YMKCameraPosition(target: points[0].pointOnMap, zoom: 10, azimuth: 0, tilt: 0),
                animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 3),
                cameraCallback: nil)
            NotificationCenter.default.post(name: NSNotification.Name("reloadBottomSheet"), object: nil)
        }
        map.move(
            with: YMKCameraPosition.init(target: defaultLocation, zoom: 10, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 0),
            cameraCallback: nil)
        title = "Map"
    }
    @objc func setup(map : UIView){
        map.translatesAutoresizingMaskIntoConstraints = false
        map.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        map.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        map.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        map.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    @objc func moveTo(notification : NSNotification){
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: notification.object as! YMKPoint, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 1),
            cameraCallback: nil)
    }
    func createButton(){
        let imageView = UIImageView(image: UIImage(systemName: "chevron.compact.up")!)
        imageView.contentMode = .scaleAspectFit
        let button = UIButton()
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        button.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -view.frame.height*0.09).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor , multiplier: 0.4).isActive = true
        button.heightAnchor.constraint(equalTo: view.heightAnchor , multiplier: 0.06).isActive = true
    }
    @objc func onTap(){
        if let sheet = viewControllerToPresent.sheetPresentationController{
            sheet.detents = [ .medium() , .large()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
        print("it has been tapped")
    }
}
