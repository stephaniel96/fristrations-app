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
    var roomURL:String = "https://fristrations.firebaseio.com/rooms"
    
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var routerLabel: UILabel!
    
    var roomsRef: Firebase!
  
    
    override func viewDidLoad() {
        roomsRef = Firebase(url:roomURL)
        self.title = roomNumber
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        roomsRef.observeEventType(.Value, withBlock: {
            snapshot in
            let rooms = snapshot.value as! NSDictionary
            self.room = rooms[self.roomNumber] as! NSDictionary
            self.title = self.room["room_name"] as? String
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookElThirty(sender: AnyObject) {
        let times = room["times"] as! NSDictionary
        let timeDetails = times["11:30am-12:00pm"] as! String
        var setTime = ["11:30am-12:00pm":"cjhsu"]
        if (timeDetails == "n/a") {
            setTime = ["11:30am-12:00pm":"cjhsu"]
        }
        else {
            setTime = ["11:30am-12:00pm":"n/a"]
        }
        var singleRoomRef = roomURL + "/" + roomNumber
        var single = singleRoomRef.childByAppendingPath("times")
        single.updateChildValues(setTime)
    }
    
    @IBAction func bookSixPm(sender: AnyObject) {
        
        
        
    }
   
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
