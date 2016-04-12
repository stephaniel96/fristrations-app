//
//  ThirdFloor.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class ThirdFloor: UIViewController {
    
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
        vc.roomNumber = sender as! String
    }
    
    @IBAction func selectRoom303(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist303")
    }
    
    
    @IBAction func selectRoom307(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist307")
    }
    
    
    @IBAction func selectRoom309(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist309")
    }


}
