//
//  ExtensionDelegate.swift
//  Home App WatchKit Extension
//
//  Created by Chris Seitz on 11/24/17.
//  Copyright © 2017 Chris Seitz. All rights reserved.
//

import WatchKit
import CoreLocation
import UIKit
import Foundation

struct _G {
    static var delegate: ExtensionDelegate?
    static var locationManager: CLLocationManager?
    
}

class ExtensionDelegate: NSObject, WKExtensionDelegate, CLLocationManagerDelegate {
    
    //let locationManager = _G.locationManager

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
        //self.startCheckingLocation()
        //let self.locationManager = _G.manager
        _G.delegate = self
        
        DispatchQueue.main.async {
            _G.locationManager = CLLocationManager()
            self.startCheckingLocation()
        }
        
        let ok = Trigger()
        
        func callb(data: [AnyHashable: AnyHashable]) -> Void {
            
        }
        ok.on(name: "Test1", callback: callb)
        ok.on(name: "Test1", callback: { data in
            let data = data as! [String: Any]
            print("OK ITS TEST 1")
            print(data["ye"] as Any)
        })
        ok.on(name: "Test2", callback: { data in
            let data = data as! [String: Any]
            print("YES ITS TEST 2")
            print(data["ye"] as Any)
        })
        ok.invoke(name: "Test1", data: ["ye": "ok hi"])
        ok.invoke(name: "Test2", data: ["ye": "wat"])
    }
    
    func startCheckingLocation() {
        guard CLLocationManager.locationServicesEnabled() else {
            print("Please enabled location services.")
            return
        }
        
        let authStatus = CLLocationManager.authorizationStatus()
        if (authStatus == .authorizedAlways) {
            _G.locationManager?.delegate = self
            _G.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            _G.locationManager?.startUpdatingLocation()
            _G.locationManager?.allowsBackgroundLocationUpdates = true
        } else {
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        //print(newLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //self.startCheckingLocation()
        //presentController(withNames: ["Menu", "Proximity"], contexts: [false, false])
        //presentController(withNames: ["MainMenu", "ProximityMenu"], contexts: ["hi", "hi"])
        
        
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        // Sent when the system needs to launch the application in the background to process tasks. Tasks arrive in a set, so loop through and process each one.
        if (1 == 1) {
            //return
        }
        for task in backgroundTasks {
            // Use a switch statement to check the task type
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                // Be sure to complete the background task once you’re done.
                backgroundTask.setTaskCompletedWithSnapshot(false)
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                // Snapshot tasks have a unique completion call, make sure to set your expiration date
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                // Be sure to complete the connectivity task once you’re done.
                connectivityTask.setTaskCompletedWithSnapshot(false)
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                // Be sure to complete the URL session task once you’re done.
                urlSessionTask.setTaskCompletedWithSnapshot(false)
            default:
                // make sure to complete unhandled task types
                task.setTaskCompletedWithSnapshot(false)
            }
        }
    }

}
