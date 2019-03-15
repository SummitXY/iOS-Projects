//
//  PickupViewController.swift
//  UberClone
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
class PickupViewController: UIViewController,MKMapViewDelegate {

    var riderEmail = ""
    var riderLocation = CLLocationCoordinate2D()
    var driverLocation = CLLocationCoordinate2D()
    let reference = Database.database().reference()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func pickupRequest(_ sender: UIButton) {
        reference.child("RiderRequest").queryOrdered(byChild: "email").queryEqual(toValue: riderEmail).observeSingleEvent(of: .childAdded) { (dataSnapShot) in
            print("RiderRequest update success \(self.riderEmail)")
            dataSnapShot.ref.updateChildValues(["driverLat":self.driverLocation.latitude,"dirverLon":self.driverLocation.longitude])
            let riderCLLocation = CLLocation(latitude: self.riderLocation.latitude, longitude: self.riderLocation.longitude)
            
            CLGeocoder().reverseGeocodeLocation(riderCLLocation, completionHandler: { (clplacemarks, error) in
                if error != nil{
                    print(riderCLLocation)
                    print("GLGeocoder has error")
                    print(error)
                } else {
                    if let placemarks = clplacemarks {
                        if placemarks.count > 0{
                            let placeMark = MKPlacemark(placemark: placemarks[0])
                            let mapItem = MKMapItem(placemark: placeMark)
                            mapItem.name = self.riderEmail
                            
                            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])
                        }
                    }
                }
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: riderLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = riderLocation
        annotation.title = "Rider Location"
        mapView.addAnnotation(annotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
