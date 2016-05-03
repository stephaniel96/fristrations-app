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
    let revDisplayRoom =
        ["Frist 114" : "frist114",
         "Frist 205" : "frist205",
         "Frist 206" : "frist206",
         "Frist 207" : "frist207",
         "Frist 208" : "frist208",
         "Frist 209" : "frist209",
         "Frist 210" : "frist210",
         "Frist 212" : "frist212",
         "Frist 227" : "frist227",
         "Frist 228" : "frist228",
         "Frist 234" : "frist234",
         "Frist 303" : "frist303",
         "Frist 307" : "frist307",
         "Frist 309" : "frist309"]
    
    var personalReservation = [String]()
    
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
        
        
        var userRef = Firebase(url: (userURL + "/reservations"))
        
        userRef.observeEventType(.Value, withBlock: {
            snapshot in
            print(uName)
            if (snapshot.exists()) {
                self.reservations = snapshot.value as! NSDictionary
                for eachReservation in self.reservations {
                    self.personalReservation.append((eachReservation.key) as! String)
                    self.tableView.reloadData()
                }
            }
            
            
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
        vc.roomNumber = revDisplayRoom[personalReservation[sender.tag]]!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Customcell2", forIndexPath: indexPath) as! ReservedCustomCell
        cell.backgroundColor = UIColor.clearColor()
        cell.roomButton.tag = indexPath.row
        cell.roomButton.setTitle(personalReservation[indexPath.row], forState: .Normal)
        cell.roomButton.addTarget(self, action: #selector(AvailableViewController.roomButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.roomButton.backgroundColor = UIColor.clearColor()
        cell.roomButton.layer.cornerRadius = 5
        cell.roomButton.layer.borderWidth = 1
        cell.roomButton.layer.borderColor = UIColor.whiteColor().CGColor
        return cell
    }
    

    
}
