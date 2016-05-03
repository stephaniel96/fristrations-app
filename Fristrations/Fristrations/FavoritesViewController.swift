//
//  FavoritesViewController.swift
//  Fristrations
//
//  Created by Christina Huang on 5/3/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//



import UIKit
import Firebase
import Kanna

class FavoritesViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate{
    

    
    @IBOutlet weak var tableView: UITableView!
    var casV: UIWebView!
    var roomRef: Firebase!
    var currentTime:String!
    var user: NSDictionary = [String:String]()
    var favorites: NSDictionary = [String:String]()
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
    
    var favoriteList = [String]()
    
    
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
        self.favoriteList.removeAll()
        
        
        var userRef = Firebase(url: (userURL + "/favorites"))
        
        userRef.observeEventType(.Value, withBlock: {
            snapshot in
            print(uName)
            if (snapshot.exists()) {
                self.favorites = snapshot.value as! NSDictionary
                for eachFavorite in self.favorites {
                    self.favoriteList.append((eachFavorite.key) as! String)
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
        return favoriteList.count
    }
    
    func roomButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("goToRoomData", sender: sender)
        
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RoomInfo
        vc.roomNumber = favoriteList[sender.tag]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Customcell3", forIndexPath: indexPath) as! FavoritesCustomCell
        cell.backgroundColor = UIColor.clearColor()
        cell.roomButton.tag = indexPath.row
        cell.roomButton.setTitle(displayRoom[favoriteList[indexPath.row]], forState: .Normal)
        cell.roomButton.addTarget(self, action: #selector(AvailableViewController.roomButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.roomButton.backgroundColor = UIColor.clearColor()
        cell.roomButton.layer.cornerRadius = 5
        cell.roomButton.layer.borderWidth = 1
        cell.roomButton.layer.borderColor = UIColor.whiteColor().CGColor
        return cell
    }
    
    
    
}

