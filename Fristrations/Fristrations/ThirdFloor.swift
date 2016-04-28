//
//  ThirdFloor.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class ThirdFloor: UIViewController {
    
    @IBOutlet weak var room303: UIButton!
    @IBOutlet weak var room307: UIButton!
    @IBOutlet weak var room309: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "300 Level"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0.32, green: 0.473, blue: 0.643, alpha: 1)
        
        room303.backgroundColor = UIColor.clearColor()
        room303.layer.cornerRadius = 5
        room303.layer.borderWidth = 1
        room303.layer.borderColor = UIColor.whiteColor().CGColor
        
        room307.backgroundColor = UIColor.clearColor()
        room307.layer.cornerRadius = 5
        room307.layer.borderWidth = 1
        room307.layer.borderColor = UIColor.whiteColor().CGColor
        
        room309.backgroundColor = UIColor.clearColor()
        room309.layer.cornerRadius = 5
        room309.layer.borderWidth = 1
        room309.layer.borderColor = UIColor.whiteColor().CGColor

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
