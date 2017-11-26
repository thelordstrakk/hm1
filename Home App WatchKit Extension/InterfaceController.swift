//
//  InterfaceController.swift
//  Home App WatchKit Extension
//
//  Created by Chris Seitz on 11/24/17.
//  Copyright © 2017 Chris Seitz. All rights reserved.
//

import WatchKit
import Foundation
import UIKit

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var BackgroundBlur: WKInterfaceGroup!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        presentController(withNames: ["Menu", "Proximity"], contexts: ["hi","hi"])
        //let controllers = ["Menu", "Proximity"]
        
        //presentController(withNames: controllers, contexts: [false, false])
        
        //let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        
        
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
