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
    
    //let ok = Trigger()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        presentController(withNames: ["Menu", "Proximity"], contexts: ["hi","hi"])
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //presentController(withNames: ["MainMenu", "ProximityMenu"], contexts: ["hi", "hi"])
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
