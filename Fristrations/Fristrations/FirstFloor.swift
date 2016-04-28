//
//  FirstFloor.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class FirstFloor: UIViewController {

    @IBOutlet weak var room114: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "100 Level"
        self.view.backgroundColor = UIColor(red: 0.32, green: 0.473, blue: 0.643, alpha: 1)
        // Do any additional setup after loading the view.
        
        room114.backgroundColor = UIColor.clearColor()
        room114.layer.cornerRadius = 5
        room114.layer.borderWidth = 1
        room114.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RoomInfo
        vc.roomNumber = sender as! String
    }

    @IBAction func selectRoom114(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist114")
    }


}
