//
//  Room.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/7/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import Foundation
import Firebase

public class Room {
    
    var name: String = ""
    var numPeople: Int = 0
    
    init (name: String) {
        self.name = name
        let address = "https://fristrations.firebaseio.com/rooms/" + name
        let ref = Firebase(url: address)
        ref.observeEventType(.Value, withBlock: { snapshot in
            let info =  snapshot
        
            let resSnapshot = info.childSnapshotForPath("reservation/reserved");
            let re = resSnapshot.value;
            print(resSnapshot)
            print(re)
         }, withCancelBlock: { error in
         print("error")
         })
        
        
        
    }
    
}
