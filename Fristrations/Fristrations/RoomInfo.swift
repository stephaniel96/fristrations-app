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
    let displayTime = [800: "8:00-8:30am", 830: "8:30-9:00am", 900: "9:00-9:30am", 930: "9:30-10:00am", 1000: "10:00-10:30am", 1030: "10:30-11:00am", 1100: "11:00-11:30am", 1130: "11:30am-12:00pm", 1200: "12:00-12:30pm"]
    
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
        button80am.tag = 800
        button80am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button83am.tag = 830
        button83am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button90am.tag = 900
        button90am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button93am.tag = 930
        button93am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button100am.tag = 1000
        button100am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button103am.tag = 1030
        button103am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button110am.tag = 1100
        button110am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button113am.tag = 1130
        button113am.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button120pm.tag = 1200
        button120pm.addTarget(self, action: #selector(self.buttonClicked(_:)), forControlEvents: .TouchUpInside)

    }
    
    func buttonClicked(sender:UIButton!)
    {
        // sender.tag is the military time
        // timeDetails is the booking
        // setTime is the dictionary we want to update
        // time is the display format (8:00 - 8:30)
        let time = displayTime[sender.tag]
        let timeDetails = self.times[time!] as! String
        var setTime = [String:String]()
        if (timeDetails == "n/a") {
            setTime = [time!:"cjhsu"]
        }
        else {
            setTime = [time!:"n/a"]
        }
        let single = roomRef.childByAppendingPath("times")
        single.updateChildValues(setTime)
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
    
        
        
}
    

