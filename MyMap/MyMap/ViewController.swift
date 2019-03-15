//
//  ViewController.swift
//  MyMap
//
//  Created by apple on 2019/3/9.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var navBtn: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func updateMapView(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.centerUserLocation()
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navBtn.layer.cornerRadius = 25
        navBtn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        mapView.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func centerUserLocation()  {
        if let coordinate = locationManager.location?.coordinate {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            
            mapView.setRegion(region, animated: true)
        }
        
        
    }


}

