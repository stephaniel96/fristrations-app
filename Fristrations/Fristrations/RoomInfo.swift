//
//  RoomInfo.swift
//  Fristrations
//
//  Created by Christina Huang on 4/11/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//


import UIKit
import Firebase

class RoomInfo: UIViewController{
    var roomNumber:String = ""
    var roomPopulation:String = ""
    var room: NSDictionary = [String:String]()
    var roomURL:String = "https://fristrations.firebaseio.com/rooms/"
    var times: NSDictionary = [String:String]()
    var roomRef: Firebase!
    var currentTime:String!
    let displayTime =
        [800: "8:00 - 8:30AM",
         830: "8:30 - 9:00AM",
         900: "9:00 - 9:30AM",
         930: "9:30 - 10:00AM",
         1000: "10:00 - 10:30AM",
         1030: "10:30 - 11:00AM",
         1100: "11:00 - 11:30AM",
         1130: "11:30 - 12:00AM",
         1200: "12:00 - 12:30PM",
         1230: "12:30 - 1:00PM",
         1300: "1:00 - 1:30PM",
         1330: "1:30 - 2:00PM",
         1400: "2:00 - 2:30PM",
         1430: "2:30 - 3:00PM",
         1500: "3:00 - 3:30PM",
         1530: "3:30 - 4:00PM",
         1600: "4:00 - 4:30PM",
         1630: "4:30 - 5:00PM",
         1700: "5:00 - 5:30PM",
         1730: "5:30 - 6:00PM",
         1800: "6:00 - 6:30PM",
         1830: "6:30 - 7:00PM",
         1900: "7:00 - 7:30PM",
         1930: "7:30 - 8:00PM",
         2000: "8:00 - 8:30PM",
         2030: "8:30 - 9:00PM",
         2100: "9:00 - 9:30PM",
         2130: "9:30 - 10:00PM",
         2200: "10:00 - 10:30PM",
         2230: "10:30 - 11:00PM",
         2300: "11:00 - 11:30PM",
         2330: "11:30 - 12:00AM",
         2400: "12:00 - 12:30AM",
         2430: "12:30 - 1:00AM",
         2500: "1:00 - 1:30AM",
         2530: "1:30 - 2:00AM"]
    
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
    
//    @IBOutlet weak var router208: UIImageView!
    @IBOutlet var buttonPressed: [UIButton]!
  
    @IBOutlet weak var floorplan: UIImageView!
    @IBOutlet weak var roomText: UILabel!
    
    func getCurrentTime() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Minute , .Hour], fromDate: date)
        let minute =  components.minute
        let hour = components.hour
        var currentMinute = ""
        if (minute >= 30) {
            currentMinute = "30"
        }
        else {
            currentMinute = "00"
        }
        currentTime = String(hour) + currentMinute
        if (currentTime == "000")
        {
            currentTime = "2400"
        }
        if (currentTime == "030") {
            currentTime = "2430"
        }
        if (currentTime == "100") {
            currentTime = "2500"
        }
        if (currentTime == "130") {
            currentTime = "2530"
        }
    }
    override func viewDidLoad() {
        roomRef = Firebase(url:(roomURL + roomNumber))
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0.32, green: 0.473, blue: 0.643, alpha: 1)
        
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
        button00.tag = 2400
        button30.tag = 2430
        button100.tag = 2500
        button130.tag = 2530
        
        
        button80am.layer.cornerRadius = 5
        button83am.layer.cornerRadius = 5
        button90am.layer.cornerRadius = 5
        button93am.layer.cornerRadius = 5
        button100am.layer.cornerRadius = 5
        button103am.layer.cornerRadius = 5
        button110am.layer.cornerRadius = 5
        button113am.layer.cornerRadius = 5
        button120pm.layer.cornerRadius = 5
        button1230.layer.cornerRadius = 5
        button1300.layer.cornerRadius = 5
        button1330.layer.cornerRadius = 5
        button1400.layer.cornerRadius = 5
        button1430.layer.cornerRadius = 5
        button1500.layer.cornerRadius = 5
        button1530.layer.cornerRadius = 5
        button1600.layer.cornerRadius = 5
        button1630.layer.cornerRadius = 5
        button1700.layer.cornerRadius = 5
        button1730.layer.cornerRadius = 5
        button1800.layer.cornerRadius = 5
        button1830.layer.cornerRadius = 5
        button1900.layer.cornerRadius = 5
        button1930.layer.cornerRadius = 5
        button2000.layer.cornerRadius = 5
        button2030.layer.cornerRadius = 5
        button2100.layer.cornerRadius = 5
        button2130.layer.cornerRadius = 5
        button2200.layer.cornerRadius = 5
        button2230.layer.cornerRadius = 5
        button2300.layer.cornerRadius = 5
        button2330.layer.cornerRadius = 5
        button00.layer.cornerRadius = 5
        button30.layer.cornerRadius = 5
        button100.layer.cornerRadius = 5
        button130.layer.cornerRadius = 5

        
        
    }
    
//    func getNumberFromRouter(routerName: String) {
//        let thisRouter = Firebase(url:("https://fristrations.firebaseio.com/router_data/"))
//        thisRouter.observeEventType(.Value, withBlock: {
//            snapshot in
//            let router = snapshot.value as! NSDictionary
//            self.roomPopulation = router[routerName] as! String
//            self.roomText.text = self.roomText.text! + self.roomPopulation + " people are nearby."
//
//        })
//    }
    
    @IBAction func buttonClicked(sender: UIButton!) {
        if (uName != "n/a")
        {
            for timeButton in buttonPressed {
                if (sender == timeButton && (Int(timeButton.tag) >= Int(self.currentTime))) {
                    let timeDetails = self.times[String(timeButton.tag)] as! String
                    var setTime = [String:String]()
                    if (timeDetails == "n/a") {
                        setTime = [String(timeButton.tag):uName]
                    }
                    else if (timeDetails == uName){
                        setTime = [String(timeButton.tag):"n/a"]
                    }
                    let single = roomRef.childByAppendingPath("times")
                    single.updateChildValues(setTime)
                    break
                }
            }
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        roomRef.observeEventType(.Value, withBlock: {
            snapshot in
            self.room = snapshot.value as! NSDictionary
            self.times = self.room["times"] as! NSDictionary
            self.title = self.room["room_name"] as? String
            self.getCurrentTime()
            
            for timeButton in self.buttonPressed {
                let time = self.displayTime[timeButton.tag]
                let timeDetails = self.times[String(timeButton.tag)] as? String

                if (timeDetails == "n/a") {
                    timeButton.backgroundColor = UIColor(red: 68/255, green: 255/255, blue: 155/255, alpha: 0.5) // 78 213 171
                    timeButton.setTitle(time!, forState: UIControlState.Normal)
                }
                else {
                    timeButton.backgroundColor = UIColor(red: 243/255, green: 0/255, blue: 0/255, alpha: 0.6) //233 90 76
                    //checks if reservation is the user's or another users
                    let spaceCount = timeDetails!.characters.filter{$0 == " "}.count
                    
                    
                    if ((timeDetails == uName) || (spaceCount == 1)){
                        timeButton.setTitle(time! + ": " + timeDetails! , forState: UIControlState.Normal)
                    }
                    else {
                        timeButton.setTitle(time! + ": Reserved", forState: UIControlState.Normal)
                    }
                }
                
                if (Int(timeButton.tag) < Int(self.currentTime)) {
                    timeButton.backgroundColor = UIColor(red: 0.49, green: 0.573, blue: 0.643, alpha: 0.3)
                    timeButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.3), forState: UIControlState.Normal)
                }
                
            }
            
            //available or not
            let routerName = self.room["router"] as! String
            
            
            let thisRouter = Firebase(url:("https://fristrations.firebaseio.com/router_data/" + routerName))
            thisRouter.observeSingleEventOfType(.Value, withBlock: {
                snapshot in
                
                self.roomPopulation = snapshot.value as! String
                self.times = self.room["times"] as! NSDictionary
                let currentTimeDetails = self.times[self.currentTime] as! String
                var num_people = String()
                
                let frm: CGRect = self.floorplan.frame
                let xx: String = String(frm.origin.x)
                
                if (self.roomPopulation == "1") {
                    num_people = self.roomPopulation + " person is nearby."
                }
                else {
                    num_people = self.roomPopulation + " people are nearby."
                }
                if (currentTimeDetails == "n/a") {
                    self.roomText.text = "This room is not currently reserved.\n" + num_people
                    
                }
                else {
                    self.roomText.text = "This room is currently reserved.\n" + num_people
                }
            })
        
            let arrayOfRouters2 = ["arun-2845", "arun-2846", "arun-2847", "arun-2848", "arun-2849", "arun-2850",
            "arun-2851", "arun-2852", "arun-2853", "arun-2854", "arun-2855", "arun-2856", "arun-2857", "arun-2858", "arun-2859", "arun-2860", "arun-2861", "arun-2862", "arun-2863", "arun-2864", "arun-2865", "arun-2866", "arun-2867", "arun-2868", "arun-2869", "arun-2870", "arun-2871", "arun-2872", "arun-2873", "arun-2874", "arun-2875"]
            var xVal: CGFloat = 0
            var yVal: CGFloat = 0
            
            for router in arrayOfRouters2 {
                let thisRouter = Firebase(url:("https://fristrations.firebaseio.com/router_data/" + router))
                thisRouter.observeSingleEventOfType(.Value, withBlock: {
                    snapshot in
                    
                    self.roomPopulation = snapshot.value as! String
                    let frm: CGRect = self.floorplan.frame
                    let ratio = frm.height/239.0
                    let radius: Int! = Int(self.roomPopulation)
                    let CGradius = CGFloat(3*radius)

                    
                    if (router == "arun-2845") {
                        xVal = frm.origin.x+8-(CGradius/2)
                        yVal = frm.origin.y+94*ratio-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                    
                    else if (router == "arun-2846") {
                        xVal = frm.origin.x+8-(CGradius/2)
                        yVal = frm.origin.y+51-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2847") {
                        xVal = frm.origin.x+15-(CGradius/2)
                        yVal = frm.origin.y-12-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2848") {
                        xVal = frm.origin.x+9-(CGradius/2)
                        yVal = frm.origin.y-55-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2849") {
                        xVal = frm.origin.x+30-(CGradius/2)
                        yVal = frm.origin.y+120-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2850") {
                        xVal = frm.origin.x+45-(CGradius/2)
                        yVal = frm.origin.y+99-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                    
                    else if (router == "arun-2851") {
                        xVal = frm.origin.x+47-(CGradius/2)
                        yVal = frm.origin.y+55-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                    
                    else if (router == "arun-2852") {
                        xVal = frm.origin.x+45-(CGradius/2)
                        yVal = frm.origin.y+11-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2853") {
                        xVal = frm.origin.x+42-(CGradius/2)
                        yVal = frm.origin.y-50-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2854") {
                        xVal = frm.origin.x+76-(CGradius/2)
                        yVal = frm.origin.y+85-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2855") {
                        xVal = frm.origin.x+87-(CGradius/2)
                        yVal = frm.origin.y-34-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2856") {
                        xVal = frm.origin.x+102-(CGradius/2)
                        yVal = frm.origin.y+121-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2857") {
                        xVal = frm.origin.x+109-(CGradius/2)
                        yVal = frm.origin.y+3-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                        
                    else if (router == "arun-2858") {
                        xVal = frm.origin.x+127-(CGradius/2)
                        yVal = frm.origin.y+85-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                    
                    else if (router == "arun-2859") {
                        xVal = frm.origin.x+127-(CGradius/2)
                        yVal = frm.origin.y-27-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                    
                    else if (router == "arun-2863") {
                        xVal = frm.origin.x+180-(CGradius/2)
                        yVal = frm.origin.y-40-(CGradius/2)
                        let imageView1 = UIImageView(frame: CGRectMake(xVal*ratio, yVal*ratio, CGradius*ratio, CGradius*ratio)); // set as you want
                        let image1 = UIImage(named: "routers");
                        imageView1.image = image1;
                        self.floorplan.addSubview(imageView1);
                    }
                    
                    
                })
            
            }

            
            
        })
        
        
//        let thisRoom = Firebase(url:(roomURL + roomNumber))
//        getCurrentTime()
//        thisRoom.observeEventType(.Value, withBlock: {
//            snapshot in
//            self.room = snapshot.value as! NSDictionary
//            let routerName = self.room["router"] as! String
//            self.getNumberFromRouter(routerName)
//            self.times = self.room["times"] as! NSDictionary
//            let timeDetails = self.times[self.currentTime] as! String
//            if (timeDetails == "n/a") {
//                self.roomText.text = "This room is currently available. "
//                
//            }
//            else {
//                self.roomText.text = "This room is currently unavailable. "
//            }
//        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
        
}
    

