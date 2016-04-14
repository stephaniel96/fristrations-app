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
    let displayTime = [800: "8:00-8:30am", 830: "8:30-9:00am", 900: "9:00-9:30am", 930: "9:30-10:00am", 1000: "10:00-10:30am", 1030: "10:30-11:00am", 1100: "11:00-11:30am", 1130: "11:30am-12:00pm", 1200: "12:00-12:30pm", 1230: "12:30-1:00pm",
        1300: "1:00-1:30pm",
        1330: "1:30-2:00pm",
        1400: "2:00-2:30pm",
        1430: "2:30-3:00pm",
        1500: "3:00-3:30pm",
        1530: "3:30-4:00pm",
        1600: "4:00-4:30pm",
        1630: "4:30-5:00pm",
        1700: "5:00-5:30pm",
        1730: "5:30-6:00pm",
        1800: "6:00-6:30pm",
        1830: "6:30-7:00pm",
        1900: "7:00-7:30pm",
        1930: "7:30-8:00pm",
        2000: "8:00-8:30pm",
        2030: "8:30-9:00pm",
        2100: "9:00-9:30pm",
        2130: "9:30-10:00pm",
        2200: "10:00-10:30pm",
        2230: "10:30-11:00pm",
        2300: "11:00-11:30pm",
        2330: "11:30pm-12:00am",
        0: "12:00-12:30am",
        30: "12:30-1:00am",
        100: "1:00-1:30am",
        130: "1:30-2:00am"]
    
    @IBOutlet weak var button80am: UIButton!
    @IBOutlet weak var button83am: UIButton!
    @IBOutlet weak var button90am: UIButton!
    @IBOutlet weak var button93am: UIButton!
    @IBOutlet weak var button100am: UIButton!
    @IBOutlet weak var button103am: UIButton!
    @IBOutlet weak var button110am: UIButton!
    @IBOutlet weak var button113am: UIButton!
    @IBOutlet weak var button120pm: UIButton!
    @IBOutlet weak var button1230: UIButton!
    @IBOutlet weak var button1300: UIButton!
    @IBOutlet weak var button1330: UIButton!
    @IBOutlet weak var button1400: UIButton!
    @IBOutlet weak var button1430: UIButton!
    @IBOutlet weak var button1500: UIButton!
    @IBOutlet weak var button1530: UIButton!
    @IBOutlet weak var button1600: UIButton!
    @IBOutlet weak var button1630: UIButton!
    @IBOutlet weak var button1700: UIButton!
    @IBOutlet weak var button1730: UIButton!
    @IBOutlet weak var button1800: UIButton!
    @IBOutlet weak var button1830: UIButton!
    @IBOutlet weak var button1900: UIButton!
    @IBOutlet weak var button1930: UIButton!
    @IBOutlet weak var button2000: UIButton!
    @IBOutlet weak var button2030: UIButton!
    @IBOutlet weak var button2100: UIButton!
    @IBOutlet weak var button2130: UIButton!
    @IBOutlet weak var button2200: UIButton!
    @IBOutlet weak var button2230: UIButton!
    @IBOutlet weak var button2300: UIButton!
    @IBOutlet weak var button2330: UIButton!
    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button100: UIButton!
    @IBOutlet weak var button130: UIButton!
    
    @IBOutlet var buttonPressed: [UIButton]!
  
    
    override func viewDidLoad() {
        roomRef = Firebase(url:(roomURL + roomNumber))
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        button80am.tag = 800
        button83am.tag = 830
        button90am.tag = 900
        button93am.tag = 930
        button100am.tag = 1000
        button103am.tag = 1030
        button110am.tag = 1100
        button113am.tag = 1130
        button120pm.tag = 1200
        button1230.tag = 1230
        button1300.tag = 1300
        button1330.tag = 1330
        button1400.tag = 1400
        button1430.tag = 1430
        button1500.tag = 1500
        button1530.tag = 1530
        button1600.tag = 1600
        button1630.tag = 1630
        button1700.tag = 1700
        button1730.tag = 1730
        button1800.tag = 1800
        button1830.tag = 1830
        button1900.tag = 1900
        button1930.tag = 1930
        button2000.tag = 2000
        button2030.tag = 2030
        button2100.tag = 2100
        button2130.tag = 2130
        button2200.tag = 2200
        button2230.tag = 2230
        button2300.tag = 2300
        button2330.tag = 2330
        button00.tag = 0
        button30.tag = 30
        button100.tag = 100
        button130.tag = 130
        

    }
    
    @IBAction func buttonClicked(sender: UIButton!) {
        for button in buttonPressed {
            if (sender == button) {
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
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        roomRef.observeEventType(.Value, withBlock: {
            snapshot in
            self.room = snapshot.value as! NSDictionary
            self.times = self.room["times"] as! NSDictionary
            self.title = self.room["room_name"] as? String
            
//            for button in self.buttonPressed {
//                let time = self.displayTime[button.tag]
//                let timeDetails = self.times[time!] as! String
//                if (timeDetails == "n/a") {
//                    button.backgroundColor = UIColor.greenColor()
//                    button.setTitle(time!, forState: UIControlState.Normal)
//                }
//                else {
//                    button.setTitle(time! + ": " + timeDetails , forState: UIControlState.Normal)
//                    button.backgroundColor = UIColor.redColor()
//                }
//            }
            
                    })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
        
}
    

