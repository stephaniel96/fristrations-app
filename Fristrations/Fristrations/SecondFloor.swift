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
    @IBOutlet weak var room228: UIButton!
    @IBOutlet weak var room234: UIButton!
    
    var rootRef: Firebase!

    override func viewDidLoad() {
        rootRef = Firebase(url:"https://fristrations.firebaseio.com/rooms")
        super.viewDidLoad()
        self.title = "200 Level"
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0.32, green: 0.473, blue: 0.643, alpha: 1)
        
        room205.backgroundColor = UIColor.clearColor()
        room205.layer.cornerRadius = 5
        room205.layer.borderWidth = 1
        room205.layer.borderColor = UIColor.whiteColor().CGColor
        
        room206.backgroundColor = UIColor.clearColor()
        room206.layer.cornerRadius = 5
        room206.layer.borderWidth = 1
        room206.layer.borderColor = UIColor.whiteColor().CGColor
        
        room207.backgroundColor = UIColor.clearColor()
        room207.layer.cornerRadius = 5
        room207.layer.borderWidth = 1
        room207.layer.borderColor = UIColor.whiteColor().CGColor
        
        room208.backgroundColor = UIColor.clearColor()
        room208.layer.cornerRadius = 5
        room208.layer.borderWidth = 1
        room208.layer.borderColor = UIColor.whiteColor().CGColor
        
        room209.backgroundColor = UIColor.clearColor()
        room209.layer.cornerRadius = 5
        room209.layer.borderWidth = 1
        room209.layer.borderColor = UIColor.whiteColor().CGColor
        
        room210.backgroundColor = UIColor.clearColor()
        room210.layer.cornerRadius = 5
        room210.layer.borderWidth = 1
        room210.layer.borderColor = UIColor.whiteColor().CGColor
        
        room212.backgroundColor = UIColor.clearColor()
        room212.layer.cornerRadius = 5
        room212.layer.borderWidth = 1
        room212.layer.borderColor = UIColor.whiteColor().CGColor
        
        room227.backgroundColor = UIColor.clearColor()
        room227.layer.cornerRadius = 5
        room227.layer.borderWidth = 1
        room227.layer.borderColor = UIColor.whiteColor().CGColor
        
        room228.backgroundColor = UIColor.clearColor()
        room228.layer.cornerRadius = 5
        room228.layer.borderWidth = 1
        room228.layer.borderColor = UIColor.whiteColor().CGColor
        
        room234.backgroundColor = UIColor.clearColor()
        room234.layer.cornerRadius = 5
        room234.layer.borderWidth = 1
        room234.layer.borderColor = UIColor.whiteColor().CGColor

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
        self.performSegueWithIdentifier("goToRoomData", sender: "frist205")
    }

    @IBAction func selectRoom206(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist206")
    }
    
    @IBAction func selectRoom207(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist207")
    }
    @IBAction func selectRoom208(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist208")
    }
    
    @IBAction func selectRoom209(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist209")
    }

    @IBAction func selectRoom210(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist210")
    }
    
    @IBAction func selectRoom212(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist212")
    }
    
    @IBAction func selectRoom227(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist227")
    }
    
    @IBAction func selectRoom228(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist228")
    }
    
    @IBAction func selectRoom234(sender: AnyObject) {
        self.performSegueWithIdentifier("goToRoomData", sender: "frist234")
    }
    
    

}
