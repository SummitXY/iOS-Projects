//
//  ViewController.swift
//  Map Demo
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
//        let latitude:CLLocationDegrees = 23.0602072827
//        let longitude:CLLocationDegrees = 113.3918237686
//
//        let delta:CLLocationDegrees = 50
//
//        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
//
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//        let region = MKCoordinateRegion(center: location, span: span)
//
//        mapView.setRegion(region, animated: true)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addPin))
        //longPressGesture.minimumPressDuration = 4
        mapView.addGestureRecognizer(longPressGesture)
    
    }
    
    @objc func addPin(_ gesture:UILongPressGestureRecognizer){
        if gesture.state == .began {
            print("long press")
            
            let annotaion = MKPointAnnotation()
            annotaion.title = "Point"
            annotaion.subtitle = "SubPoint"
            
            let touchPoint = gesture.location(in: mapView)
            let locationCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            
            annotaion.coordinate = locationCoordinate
            mapView.addAnnotation(annotaion)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("test")
        let userLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let delta:CLLocationDegrees = 0.02
        
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    
    


}

