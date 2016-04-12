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
    
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var routerLabel: UILabel!
    
    var roomsRef: Firebase!
    
    override func viewDidLoad() {
        roomsRef = Firebase(url:"https://fristrations.firebaseio.com/rooms")
        self.title = roomNumber
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        roomLabel.text = roomNumber
        roomsRef.observeEventType(.Value, withBlock: {
            snapshot in
            let rooms = snapshot.value as! NSDictionary
            let room = rooms[self.roomNumber] as! NSDictionary
            self.roomLabel.text = room["room_name"] as? String
            self.title = room["room_name"] as? String
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
