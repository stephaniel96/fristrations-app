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

    override func viewDidLoad() {
        rootRef = Firebase(url:"https://fristrations.firebaseio.com/rooms")
        super.viewDidLoad()
        self.title = "200 Level"
        // Do any additional setup after loading the view.
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
