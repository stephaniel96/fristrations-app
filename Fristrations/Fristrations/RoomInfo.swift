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
    

    @IBOutlet weak var button80am: UIButton!
    @IBOutlet weak var button83am: UIButton!
    @IBOutlet weak var button90am: UIButton!
    @IBOutlet weak var button93am: UIButton!
    @IBOutlet weak var button100am: UIButton!
    @IBOutlet weak var button103am: UIButton!
    @IBOutlet weak var button110am: UIButton!
    @IBOutlet weak var button113am: UIButton!
    @IBOutlet weak var button120pm: UIButton!
    
   
  
    
    override func viewDidLoad() {
        roomRef = Firebase(url:(roomURL + roomNumber))
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        roomRef.observeEventType(.Value, withBlock: {
            snapshot in
            self.room = snapshot.value as! NSDictionary
            self.times = self.room["times"] as! NSDictionary
            self.title = self.room["room_name"] as? String
            
            
            var timeDetails = self.times["8:00-8:30am"] as! String
            if (timeDetails == "n/a") {
                self.button80am.backgroundColor = UIColor.greenColor()
                self.button80am.setTitle("8:00-8:30am", forState: UIControlState.Normal)
            }
            else {
                self.button80am.setTitle("8:00-8:30am: " + timeDetails , forState: UIControlState.Normal)
                self.button80am.backgroundColor = UIColor.redColor()
            }
            
            timeDetails = self.times["8:30-9:00am"] as! String
            if (timeDetails == "n/a") {
                self.button83am.backgroundColor = UIColor.greenColor()
                self.button83am.setTitle("8:30-9:00am", forState: UIControlState.Normal)
            }
            else {
                self.button83am.setTitle("8:30-9:00am: " + timeDetails , forState: UIControlState.Normal)
                self.button83am.backgroundColor = UIColor.redColor()
            }
            
            timeDetails = self.times["9:00-9:30am"] as! String
            if (timeDetails == "n/a") {
                self.button90am.backgroundColor = UIColor.greenColor()
                self.button90am.setTitle("9:00-9:30am", forState: UIControlState.Normal)
            }
            else {
                self.button90am.setTitle("9:00-9:30am: " + timeDetails , forState: UIControlState.Normal)
                self.button90am.backgroundColor = UIColor.redColor()
            }
            
            timeDetails = self.times["9:30-10:00am"] as! String
            if (timeDetails == "n/a") {
                self.button93am.backgroundColor = UIColor.greenColor()
                self.button93am.setTitle("9:30-10:00am", forState: UIControlState.Normal)
            }
            else {
                self.button93am.setTitle("9:30-10:00am: " + timeDetails , forState: UIControlState.Normal)
                self.button93am.backgroundColor = UIColor.redColor()
            }
            
            timeDetails = self.times["10:00-10:30am"] as! String
            if (timeDetails == "n/a") {
                self.button100am.backgroundColor = UIColor.greenColor()
                self.button100am.setTitle("10:00-10:30am", forState: UIControlState.Normal)
            }
            else {
                self.button100am.setTitle("10:00-10:30am: " + timeDetails , forState: UIControlState.Normal)
                self.button100am.backgroundColor = UIColor.redColor()
            }
            
            timeDetails = self.times["10:30-11:00am"] as! String
            if (timeDetails == "n/a") {
                self.button103am.backgroundColor = UIColor.greenColor()
                self.button103am.setTitle("10:30-11:00am", forState: UIControlState.Normal)
            }
            else {
                self.button103am.setTitle("10:30-11:00am: " + timeDetails , forState: UIControlState.Normal)
                self.button103am.backgroundColor = UIColor.redColor()
            }
            //11:00am
            timeDetails = self.times["11:00-11:30am"] as! String
            if (timeDetails == "n/a") {
                self.button110am.backgroundColor = UIColor.greenColor()
                self.button110am.setTitle("11:00-11:30am", forState: UIControlState.Normal)
            }
            else {
                self.button110am.setTitle("11:00-11:30am: " + timeDetails , forState: UIControlState.Normal)
                self.button110am.backgroundColor = UIColor.redColor()
            }
            
            timeDetails = self.times["11:30am-12:00pm"] as! String
            if (timeDetails == "n/a") {
                self.button113am.backgroundColor = UIColor.greenColor()
                self.button113am.setTitle("11:30am-12:00pm", forState: UIControlState.Normal)
            }
            else {
                self.button113am.setTitle("11:30am-12:00pm: " + timeDetails , forState: UIControlState.Normal)
                self.button113am.backgroundColor = UIColor.redColor()
            }
            
            timeDetails = self.times["12:00-12:30pm"] as! String
            if (timeDetails == "n/a") {
                self.button120pm.backgroundColor = UIColor.greenColor()
                self.button120pm.setTitle("12:00-12:30pm", forState: UIControlState.Normal)
            }
            else {
                self.button120pm.setTitle("12:00-12:30pm: " + timeDetails , forState: UIControlState.Normal)
                self.button120pm.backgroundColor = UIColor.redColor()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func push80am(sender: AnyObject) {
        let timeDetails = self.times["8:00-8:30am"] as! String
        var setTime = ["8:00-8:30am":"cjhsu"]
        if (timeDetails == "n/a") {
            setTime = ["8:00-8:30am":"cjhsu"]
        }
        else {
            setTime = ["8:00-8:30am":"n/a"]
        }
        let single = roomRef.childByAppendingPath("times")
        single.updateChildValues(setTime)
    }
    
    @IBAction func push83am(sender: AnyObject) {
        let timeDetails = self.times["8:30-9:00am"] as! String
        var setTime = ["8:30-9:00am":"cjhsu"]
        if (timeDetails == "n/a") {
            setTime = ["8:30-9:00am":"cjhsu"]
        }
        else {
            setTime = ["8:30-9:00am":"n/a"]
        }
        let single = roomRef.childByAppendingPath("times")
        single.updateChildValues(setTime)
    }
    
    @IBAction func push90am(sender: AnyObject) {
        let timeDetails = self.times["9:00-9:30am"] as! String
        var setTime = [String:String]()
        if (timeDetails == "n/a") {
            setTime = ["9:00-9:30am":"cjhsu"]
        }
        else {
            setTime = ["9:00-9:30am":"n/a"]
        }
        let single = roomRef.childByAppendingPath("times")
        single.updateChildValues(setTime)
    }
    
    
        
        
        
}
    

