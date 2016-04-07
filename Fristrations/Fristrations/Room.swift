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
    let ref = Firebase(url: "https://fristrations.firebaseio.com/")
    
    init (name: String) {
        self.name = name
    }
    
    let roomRef = Firebase(url: "https://fristrations.firebaseio.com/rooms/frist204")
    println(roomRef)
    
}