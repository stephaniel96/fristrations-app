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
    var ref = Firebase(url: "https://fristrations.firebaseio.com/rooms/frist204")
    
    init (name: String) {
        self.name = name
        ref.observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            }, withCancelBlock: { error in
                print("error")
        })
    }
    
}
