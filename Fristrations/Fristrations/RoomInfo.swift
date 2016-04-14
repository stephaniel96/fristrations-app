//
//  RoomInfo.swift
//  Fristrations
//
//  Created by Christina Huang on 4/11/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//


import UIKit

class RoomInfo: UIViewController{
    var roomNumber:String = ""
    var room: NSDictionary = [String:String]()
    var roomURL:String = "https://fristrations.firebaseio.com/rooms/"
    var times: NSDictionary = [String:String]()
    var roomRef: Firebase!
    
    @IBOutlet weak var button800am: UIButton!
    
    
   
  
    
    override func viewDidLoad() {
        roomRef = Firebase(url:(roomURL + roomNumber))
        self.title = roomNumber
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        roomRef.observeEventType(.Value, withBlock: {
            snapshot in
            self.room = snapshot.value as! NSDictionary
            self.times = self.room["times"] as! NSDictionary
            self.title = self.room["room_name"] as? String
            let timeDetails = self.times["8:00-8:30am"] as! String
            if (timeDetails == "n/a") {
                self.button800am.backgroundColor = UIColor.greenColor()
                self.button800am.setTitle("8:00-8:30am", forState: UIControlState.Normal)
            }
            else {
                self.button800am.setTitle("8:00-8:30am: " + timeDetails , forState: UIControlState.Normal)
                self.button800am.backgroundColor = UIColor.redColor()
            }
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func push800am(sender: AnyObject) {
        let timeDetails = self.times["8:00-8:30am"] as! String
        var setTime = ["8:00am-8:30am":"cjhsu"]
        if (timeDetails == "n/a") {
            setTime = ["8:00am-8:30am":"cjhsu"]
        }
        else {
            setTime = ["8:00am-8:30am":"n/a"]
        }
        let single = roomRef.childByAppendingPath("times")
        single.updateChildValues(setTime)
    }
    
        
        
        
}
    

