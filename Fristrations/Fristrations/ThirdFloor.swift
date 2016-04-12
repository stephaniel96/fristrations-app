//
//  ThirdFloor.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class ThirdFloor: UIViewController {

    var room:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "300 Level"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RoomInfo
        vc.roomNumber = room
    }
    
    @IBAction func selectRoom303(sender: AnyObject) {
        room = "frist303"
        self.performSegueWithIdentifier("goToRoomData", sender: sender)
    }
    
    
    @IBAction func selectRoom307(sender: AnyObject) {
        room = "frist307"
        self.performSegueWithIdentifier("goToRoomData", sender: sender)
    }
    
    
    @IBAction func selectRoom309(sender: AnyObject) {
        room = "frist309"
        self.performSegueWithIdentifier("goToRoomData", sender: sender)
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
