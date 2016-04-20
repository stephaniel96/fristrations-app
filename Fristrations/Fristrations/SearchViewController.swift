//
//  SearchViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 3/26/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Firebase

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: Properties
    
    var roomRef: Firebase!
    var currentTime:String!
    var times: NSDictionary = [String:String]()
    var room: NSDictionary = [String:String]()
    var roomURL:String = "https://fristrations.firebaseio.com/rooms/"
    let rooms = ["frist114", "frist205", "frist206", "frist207", "frist208", "frist209", "frist210", "frist212", "frist227", "frist228", "frist234", "frist303", "frist307", "frist309"]
    let displayRoom =
        ["frist114" : "Frist 114",
         "frist205" : "Frist 205",
         "frist206" : "Frist 206",
         "frist207" : "Frist 207",
         "frist208" : "Frist 208",
         "frist209" : "Frist 209",
         "frist210" : "Frist 210",
         "frist212" : "Frist 212",
         "frist227" : "Frist 227",
         "frist228" : "Frist 228",
         "frist234" : "Frist 234",
         "frist303" : "Frist 303",
         "frist307" : "Frist 307",
         "frist309" : "Frist 309"]
    var availableRooms:[String] = []
    // Called when the view controller’s content view is created and loaded from a storyboard
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Available"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false 
        // Fristrations color in RGB percentages
        view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
    }
    
    override func viewWillAppear(animated: Bool) {
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
        print(self.currentTime)
        
        
        self.availableRooms.removeAll()
        for roomNumber in rooms {
            roomRef = Firebase(url:(roomURL + roomNumber))
            
            roomRef.observeEventType(.Value, withBlock: {
                snapshot in
                
                self.room = snapshot.value as! NSDictionary
                self.times = self.room["times"] as! NSDictionary
                let timeDetails = self.times[self.currentTime] as! String
                if (timeDetails == "n/a") {
                    self.availableRooms.append(roomNumber)
                    self.tableView.reloadData()
                }
                
            })
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableRooms.count
    }

    // Use if we want the whole table cell to be the button
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("goToRoomData", sender: "frist205")
//    }
    
    func roomButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("goToRoomData", sender: sender)
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RoomInfo
        vc.roomNumber = availableRooms[sender.tag]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Customcell", forIndexPath: indexPath) as! CustomCell
        cell.roomButton.tag = indexPath.row
        cell.roomButton.setTitle(displayRoom[availableRooms[indexPath.row]], forState: .Normal)
        cell.roomButton.addTarget(self, action: #selector(SearchViewController.roomButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return cell
    }

    


    
}
