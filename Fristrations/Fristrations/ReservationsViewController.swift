//
//  ReservationsViewController.swift
//  Fristrations
//
//  Created by Christina Huang on 5/3/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Firebase
import Kanna

class ReservationsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var casV: UIWebView!
    var roomRef: Firebase!
    var currentTime:String!
    var user: NSDictionary = [String:String]()
    var reservations: NSDictionary = [String:String]()
    var userURL:String = "https://fristrations.firebaseio.com/user/" + uName
    let displayRoom =
        ["frist114" : "114",
         "frist205" : "205",
         "frist206" : "206",
         "frist207" : "207",
         "frist208" : "208",
         "frist209" : "209",
         "frist210" : "210",
         "frist212" : "212",
         "frist227" : "227",
         "frist228" : "228",
         "frist234" : "234",
         "frist303" : "303",
         "frist307" : "307",
         "frist309" : "309"]
    
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

    var personalReservation = [String]()
    var formattedReservation = [String]()
    
    // Called when the view controller’s content view is created and loaded from a storyboard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Available"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.rowHeight = 60.0
    }
    
    override func viewWillAppear(animated: Bool) {
        if (casV != nil && uName != "n/a") {
            casV.removeFromSuperview()
        }
        
        
    }
    override func viewDidAppear(animated: Bool) {
        getDataSource()
    }
    
    func getDataSource() {
        self.personalReservation.removeAll()
        self.formattedReservation.removeAll()
        
        
        var userRef = Firebase(url: (userURL + "/reservations"))
        
        userRef.observeEventType(.Value, withBlock: {
            snapshot in
            self.personalReservation.removeAll()
            self.formattedReservation.removeAll()
            if (snapshot.exists()) {
                self.reservations = snapshot.value as! NSDictionary
                for eachReservation in self.reservations {
                    self.personalReservation.append((eachReservation.key) as! String)
                    self.formattedReservation.append((eachReservation.value) as! String)
                    self.personalReservation.sortInPlace()
                    self.formattedReservation.sortInPlace()
                    print(self.formattedReservation)
                    print(self.personalReservation)
                }
            }
            self.tableView.reloadData()
            
        })
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalReservation.count
    }
    
    func roomButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("goToRoomData", sender: sender)
        
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RoomInfo
        vc.roomNumber = formattedReservation[sender.tag]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("Customcell2", forIndexPath: indexPath) as! ReservedCustomCell
        cell.backgroundColor = UIColor.clearColor()
        cell.roomButton.tag = indexPath.row
    
        let index = personalReservation[indexPath.row].startIndex.advancedBy(8)
        let time = personalReservation[indexPath.row].substringFromIndex(index)
        let displayString = displayRoom[formattedReservation[indexPath.row]]! + "   |   " + displayTime[Int(time)!]!
        cell.roomButton.setTitle(displayString, forState: .Normal)
        cell.roomButton.addTarget(self, action: #selector(AvailableViewController.roomButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.roomButton.backgroundColor = UIColor.clearColor()
        cell.roomButton.layer.cornerRadius = 5
        cell.roomButton.layer.borderWidth = 1
        cell.roomButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        return cell
    }
    
    

    
}
