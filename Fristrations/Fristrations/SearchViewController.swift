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
    var availableRooms:[String] = []
    // Called when the view controller’s content view is created and loaded from a storyboard
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Available Rooms"
        tableView.delegate = self
        tableView.dataSource = self
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableRooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Customcell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = availableRooms[indexPath.item]
        return cell
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
