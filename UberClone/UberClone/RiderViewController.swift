//
//  RiderViewController.swift
//  UberClone
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseAuth
import FirebaseDatabase
class RiderViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    var uberHasBeenCalled = false
    let locationManager = CLLocationManager()
    var userLocation = CLLocationCoordinate2D()
    let reference = Database.database().reference()
    
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        }catch{
            print("users can not signout")
        }
        navigationController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func callUber(_ sender: UIButton) {
        if let email = Auth.auth().currentUser?.email {
            if uberHasBeenCalled {
                reference.child("RiderRequest").queryOrdered(byChild: "email").queryEqual(toValue: email).observe(.childAdded) { (dataSnapShot) in
                    dataSnapShot.ref.removeValue()
                    self.reference.child("RiderRequest").removeAllObservers()
                }
                cancelUberMode()
            } else {
                let riderRequestDic : [String:Any] = ["email":email, "latitude":userLocation.latitude,"longitude":userLocation.longitude]
                reference.child("RiderRequest").childByAutoId().setValue(riderRequestDic)
                callUberMode()
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = manager.location?.coordinate{
            userLocation = coordinate
            let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            mapView.setRegion(region, animated: true)
            mapView.removeAnnotations(mapView.annotations)
            let annotaion = MKPointAnnotation()
            annotaion.coordinate = coordinate
            annotaion.title = "My Location"
            mapView.addAnnotation(annotaion)
        }
    }
    
    func callUberMode()  {
        buttonOutlet.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        buttonOutlet.setTitle("Cancel Uber", for: .normal)
        uberHasBeenCalled = true
    }
    
    func cancelUberMode()  {
        buttonOutlet.backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        buttonOutlet.setTitle("Call An Uber", for: .normal)
        uberHasBeenCalled = false
    }
    

}
