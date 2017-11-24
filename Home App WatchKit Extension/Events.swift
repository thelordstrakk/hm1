//
//  Events.swift
//  Home App WatchKit Extension
//
//  Created by Chris Seitz on 11/24/17.
//  Copyright © 2017 Chris Seitz. All rights reserved.
//

import Foundation


class Trigger {
    //var callbacks: Dictionary<AnyHashable, String>!
    var callbacks: [((String, [AnyHashable: AnyHashable])->Void)] = []
    func on(name: String, callback: @escaping ([AnyHashable: AnyHashable]) -> Void) {
        //self.callbacks[callback]: name
        //self.callbacks
        //callbacks[callback] = "ok"
        func trig(onname: String, data: [AnyHashable: AnyHashable]) -> Void {
            if (onname == name) {
                callback(data)
            }
        }
        callbacks.append(trig)
    }
    func invoke(name: String, data: [AnyHashable: AnyHashable]) {
        callbacks.forEach { trig in
            trig(name, data)
        }
    }
    
}
