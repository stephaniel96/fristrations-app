//
//  SecondFloor.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Firebase

class SecondFloor: UIViewController {

    // MARK: Properties
    @IBOutlet weak var room205: UIButton!
    @IBOutlet weak var room206: UIButton!
    @IBOutlet weak var room207: UIButton!
    @IBOutlet weak var room208: UIButton!
    @IBOutlet weak var room209: UIButton!
    @IBOutlet weak var room210: UIButton!
    @IBOutlet weak var room212: UIButton!
    @IBOutlet weak var room227: UIButton!
    
    
    var rootRef: Firebase!
    //var room:String = ""
    override func viewDidLoad() {
        rootRef = Firebase(url:"https://fristrations.firebaseio.com/rooms")
        super.viewDidLoad()
        self.title = "200 Level"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Read data and react to changes
        rootRef.observeEventType(.Value, withBlock: {
            snapshot in
            let rooms = snapshot.value as! NSDictionary
            for (room_id, room_data) in rooms {
                //print (room_id)
                let reserve = room_data["reservation"] as! NSDictionary
                //print((reserve["reserved"])!)
            }
            
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RoomInfo
        vc.roomNumber = sender as! String
    }
    
    // MARK: Actions
  
    @IBAction func selectRoom205(sender: AnyObject) {
        //room = "frist205"
        self.performSegueWithIdentifier("goToRoomData", sender: "205")
    }

    @IBAction func selectRoom206(sender: AnyObject) {
        //room = "frist206"
        self.performSegueWithIdentifier("goToRoomData", sender: "206")
    }
    
    @IBAction func selectRoom207(sender: AnyObject) {
        //room = "frist207"
        self.performSegueWithIdentifier("goToRoomData", sender: "207")
    }
    @IBAction func selectRoom208(sender: AnyObject) {
        //room = "frist208"
        self.performSegueWithIdentifier("goToRoomData", sender: "208")
    }
    
    @IBAction func selectRoom209(sender: AnyObject) {
        //room = "frist209"
        self.performSegueWithIdentifier("goToRoomData", sender: "209")
    }

    @IBAction func selectRoom210(sender: AnyObject) {
        //room = "frist210"
        self.performSegueWithIdentifier("goToRoomData", sender: "210")
    }
    
    @IBAction func selectRoom212(sender: AnyObject) {
        //room = "frist212"
        self.performSegueWithIdentifier("goToRoomData", sender: "212")
    }
    
    @IBAction func selectRoom227(sender: AnyObject) {
        //room = "frist227"
        self.performSegueWithIdentifier("goToRoomData", sender: "227")
    }
    
    @IBAction func selectRoom228(sender: AnyObject) {
        //room = "frist228"
        self.performSegueWithIdentifier("goToRoomData", sender: "228")
    }
    
    @IBAction func selectRoom234(sender: AnyObject) {
        //room = "frist234"
        self.performSegueWithIdentifier("goToRoomData", sender: "234")
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
