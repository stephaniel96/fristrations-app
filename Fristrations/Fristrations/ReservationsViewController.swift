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
    
    var availableRooms = [String]()
    
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
        self.availableRooms.removeAll()
        
        
        var userRef = Firebase(url: (userURL + uName + "/reservations"))
        
        userRef.observeEventType(.Value, withBlock: {
            snapshot in
            print(uName)
            if (snapshot.exists()) {
                self.reservations = snapshot.value as! NSDictionary
                for eachReservation in self.reservations {
                    self.availableRooms.append((eachReservation.value) as! String)
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
        return availableRooms.count
    }
    
    func loginWarning() {
        let alertController = UIAlertController(title: "Sign In", message:
            "You must have an active Princeton University netID to use Fristrations.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        alertController.addAction(UIAlertAction(title: "Sign In Now", style: UIAlertActionStyle.Default,handler: {action in
            self.casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
            self.casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.cs.princeton.edu/~cjhsu/fristrations/CASlogin.php")!))
            self.casV.delegate = self;
            self.casV.layer.zPosition = 1
            self.view.addSubview(self.casV)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func roomButtonPressed(sender: UIButton) {
        if (uName == "n/a") {
            loginWarning()
        }
        else {
            self.performSegueWithIdentifier("goToRoomData", sender: sender)
        }
    }
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject!) {
        let vc = segue.destinationViewController as! RoomInfo
        vc.roomNumber = revDisplayRoom[availableRooms[sender.tag]]!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Customcell2", forIndexPath: indexPath) as! CustomCell
        cell.backgroundColor = UIColor.clearColor()
        cell.roomButton.tag = indexPath.row
        cell.roomButton.setTitle(availableRooms[indexPath.row], forState: .Normal)
        cell.roomButton.addTarget(self, action: #selector(AvailableViewController.roomButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.roomButton.backgroundColor = UIColor.clearColor()
        cell.roomButton.layer.cornerRadius = 5
        cell.roomButton.layer.borderWidth = 1
        cell.roomButton.layer.borderColor = UIColor.whiteColor().CGColor
        return cell
    }
    
    
    func deleteAnimationComplete(value: Bool)
    {
        if (value && casV != nil)
        {
            casV.removeFromSuperview()
            casV = nil
        }
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("Webview fail with error \(error)");
    }
    
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("Webview started Loading")
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        let docPage = webView.stringByEvaluatingJavaScriptFromString("document.documentElement.outerHTML")!
        
        if let doc = Kanna.HTML(html: docPage, encoding: NSUTF8StringEncoding) {
            // Search for nodes by CSS
            let bods = doc.css("body")
            let bod = bods[0].text
            if (bod!.characters.count < 100) {
                let netID = bod!.stringByTrimmingCharactersInSet(
                    NSCharacterSet.whitespaceAndNewlineCharacterSet()
                )
                print("login successful!")
                uName = netID
                UIView.animateWithDuration(0.5, animations: {self.casV!.alpha = 0}, completion: deleteAnimationComplete)
                NSUserDefaults.standardUserDefaults().setObject(netID, forKey: "netid")
            }
        }
        
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
