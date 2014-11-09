//
//  ViewController.swift
//  getCurrentLocation
//
//  Created by Mariem Ayadi on 11/9/14.
//  Copyright (c) 2014 Mariem Ayadi. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    //NOTE:
    //The CLLocationManagerDelegate protocol defines the methods used to receive location and heading updates from a CLLocationManager object.

    let locationManager = CLLocationManager()
    //NOTE:
    //The CLLocationManager class is the central point for configuring the delivery of location- and heading-related events to your app. You use an instance of this class to establish the parameters that determine when location and heading events should be delivered and to start and stop the actual delivery of those events. You can also use a location manager object to retrieve the most recent location and heading data.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // start updatug location once the application is loaded
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        //new for iOS8. We may add a description as to why we would like to add a user's description
        self.locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        //NOTE:
        //The CLGeocoder class provides services for converting between a coordinate (specified as a latitude and longitude) and the user-friendly representation of that coordinate.
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler:{(placemarks, error) -> Void in
            
            if (error != nil){
                println("Error:" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                //NOTE:
                //A CLPlacemark object stores placemark data for a given latitude and longitude. Placemark data includes information such as the country, state, city, and street address associated with the specified coordinate
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
                
            } else {
                println("Error with data")
            }
            
        })
    }
    
    fun

}

