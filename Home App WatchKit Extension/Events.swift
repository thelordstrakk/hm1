//
//  Events.swift
//  Home App WatchKit Extension
//
//  Created by Chris Seitz on 11/24/17.
//  Copyright © 2017 Chris Seitz. All rights reserved.
//

import Foundation


struct EventGlobals {
    static var callbacks: [((String, [AnyHashable: AnyHashable])->Void)] = []
    
}

class Trigger {
    //var callbacks: Dictionary<AnyHashable, String>!
    var callbacks: [((String, [AnyHashable: AnyHashable])->Void)] = []
    var removes: [((String)->Void)] = []
    var paused = false
    func on(name: String, callback: @escaping (_ data: [AnyHashable: AnyHashable]) -> Void) {
        //self.callbacks[callback]: name
        //self.callbacks
        //callbacks[callback] = "ok"
        func trig(onname: String, data: [AnyHashable: AnyHashable]) -> Void {
            if (onname == name) {
                if (paused == false) {
                    callback(data)
                }
                //callback(data)
            }
        }
        
        EventGlobals.callbacks.append(trig)
        var appendable_index = EventGlobals.callbacks.endIndex - 1
        
        func blank(onname: String, data: [AnyHashable: AnyHashable]) -> Void {
            
        }
        
        
        func rem(remname: String) -> Void {
            if (remname == name) {
                EventGlobals.callbacks[appendable_index] = blank
            }
        }
        
        removes.append(rem)
        
    }
    func disconnect(name: String) {
        removes.forEach { rem in
            rem(name)
        }
    }
    func invoke(name: String, data: [AnyHashable: AnyHashable]) {
        EventGlobals.callbacks.forEach { trig in
            trig(name, data)
        }
    }
    
}
