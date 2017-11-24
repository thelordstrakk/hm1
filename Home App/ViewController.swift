//
//  ViewController.swift
//  Home App
//
//  Created by Chris Seitz on 11/24/17.
//  Copyright © 2017 Chris Seitz. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.authorizeLocation()
    }
    
    func authorizeLocation() {
        guard CLLocationManager.locationServicesEnabled() else {
            print("Please enabled location services.")
            return
        }
        
        let authStatus = CLLocationManager.authorizationStatus()
        if (authStatus == .authorizedAlways) {
            
        } else {
            if (authStatus == .notDetermined) {
                _G.delegate?.locationManager.requestAlwaysAuthorization()
                _G.delegate?.startCheckingLocation()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

