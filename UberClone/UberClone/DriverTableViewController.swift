//
//  DriverTableViewController.swift
//  UberClone
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreLocation
import FirebaseDatabase
class DriverTableViewController: UITableViewController,CLLocationManagerDelegate {
    
    let reference = Database.database().reference()
    var riderRequestDic = [String:Any]()
    var riderRequest = [DataSnapshot]()
    var locationManager = CLLocationManager()
    var driverLocationCoor = CLLocationCoordinate2D()
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        try? Auth.auth().signOut()
        navigationController?.dismiss(animated: true, completion: nil )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        retrieveData()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.tableView.reloadData()
        }
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return riderRequest.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RiderDataCell
        
        let snapShot = riderRequest[indexPath.row]
        
        if let riderRequestDic = snapShot.value as? [String:Any]{
            if let email = riderRequestDic["email"] as? String {
                if let latitude = riderRequestDic["latitude"] as? Double{
                    if let longitude = riderRequestDic["longitude"] as? Double {
                        let riderLocation = CLLocation(latitude: latitude, longitude: longitude)
                        let driverLocation = CLLocation(latitude: driverLocationCoor.latitude, longitude: driverLocationCoor.longitude)
                        let distance = riderLocation.distance(from: driverLocation)/1000
                        let roundedDistance = round(distance*100)/100
                        if let image = UIImage(named: "person") {
                            let riderDetail = "\(roundedDistance)km away"
                            cell.configureCell(profileImage: image, userEmail: email, detailLabel: riderDetail)
                        }
                    }
                }
            }
        }

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snapShot = riderRequest[indexPath.row]
        performSegue(withIdentifier: "pickupSegue", sender: snapShot)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickupSegue"{
            let destination = segue.destination as! PickupViewController
            if let snapShot = sender as? DataSnapshot {
                if let riderRequestDic = snapShot.value as? [String:Any]{
                    if let email = riderRequestDic["email"] as? String{
                        if let latitude = riderRequestDic["latitude"] as? Double {
                            if let longitude = riderRequestDic["longitude"] as? Double{
                                let riderLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                destination.riderEmail = email
                                destination.riderLocation = riderLocation
                                destination.driverLocation = driverLocationCoor
                            }
                        }
                    }
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        driverLocationCoor = (manager.location?.coordinate)!
    }
 
    func retrieveData()  {
        reference.child("RiderRequest").observe(.childAdded) { (dataSnapShot) in
            if let riderRequestDic = dataSnapShot.value as? [String:Any] {
                self.riderRequest.append(dataSnapShot)
                dataSnapShot.ref.removeAllObservers()
                self.tableView.reloadData()
            }
        }
    }
    
}
