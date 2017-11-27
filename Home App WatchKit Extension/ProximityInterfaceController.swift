//
//  ProximityInterfaceController.swift
//  Home App WatchKit Extension
//
//  Created by Chris Seitz on 11/24/17.
//  Copyright © 2017 Chris Seitz. All rights reserved.
//

import WatchKit
import Foundation
import UIKit

class ProximityInterfaceController: WKInterfaceController {
    
    @IBOutlet var LatitudeLabel: WKInterfaceLabel!
    @IBOutlet var LongitudeLabel: WKInterfaceLabel!
    @IBOutlet var PauseSwitch: WKInterfaceSwitch!
    @IBOutlet var TimeSinceLabel: WKInterfaceTimer!
    
    let locationTrigger = Trigger()
    
    //locationTrigger.paused = true
    
    var currentlyVisible = false
    
    var last_upd: UInt64 = 0
    
    override init() {
        
        
        
    }
    
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        //presentController(withNames: ["Menu", "Proximity"], contexts: ["hi","hi"])
        
        var main = self
        
        locationTrigger.on(name: "LocationUpdated", callback: { data in
            self.last_upd = UInt64(NSDate().timeIntervalSince1970)
            let data = data as! [String: Any]
            let lat = (data["lat"] as? String) ?? "ERROR"
            let long = (data["long"] as? String) ?? "ERROR"
            main.updateLabels(lat: lat, long: long)
        })
        
    }
    
    func updateLabels(lat: String, long: String) {
        LatitudeLabel.setText(lat)
        LongitudeLabel.setText(long)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //presentController(withNames: ["MainMenu", "ProximityMenu"], contexts: ["hi", "hi"])
        locationTrigger.paused = false
        currentlyVisible = true
        let iself = self
        /*DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            
        })*/
        /*DispatchQueue.global(qos: .background).async {
            while iself.currentlyVisible == true {
                iself.PauseSwitch.setOn((iself.locationTrigger.paused))
                //let cur_time = UInt64(NSDate().timeIntervalSince1970)
                //self.TimeSinceLabel.setValue((cur_time - self.last_upd) as! Int, forKey: <#T##String#>)
                //self.TimeSinceLabel.setDate(Date(timeIntervalSinceNow: Double(self.last_upd)))
            }
        }*/
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        currentlyVisible = false
        super.didDeactivate()
        locationTrigger.paused = true
        currentlyVisible = false
        
    }

}
