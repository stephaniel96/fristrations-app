
//
//  NearbyViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Kanna
import Foundation

var uName:String = "n/a"
var numberOfRoomsBooked = 0

class BrowseViewController: UIViewController, UIWebViewDelegate{
    
    @IBOutlet weak var fristLabel: UILabel!
    @IBOutlet weak var firstFloorButton: UIButton!
    @IBOutlet weak var secondFloorButton: UIButton!
    @IBOutlet weak var thirdFloorButton: UIButton!
    @IBOutlet weak var netIdLabel: UILabel!


    
    var casV: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Browse"
        
        
        // BACKGROUND
//        self.view.backgroundColor = UIColor(red: 180/250.0, green: 4/250.0, blue: 78/250.0, alpha: 1)
//        self.view.backgroundColor = UIColor(red: 0.32, green: 0.473, blue: 0.643, alpha: 1)
        
        let netID: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("netid")
        
//        if (netID == nil) {
//            casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
//            casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.cs.princeton.edu/~cjhsu/fristrations/CASlogin.php")!))
//            casV.delegate = self;
//            casV.layer.zPosition = 1
//            self.view.addSubview(casV)
//            netIdLabel.text = "Not Signed In"
//        }
//        else {
//            uName = netID as! String
//            netIdLabel.text = uName
//        }
        
        if (netID == nil) {
            uName = "n/a"
        }
        else {
            uName = netID as! String
        }
        
        
        firstFloorButton.backgroundColor = UIColor.clearColor()
        firstFloorButton.layer.cornerRadius = 5
        firstFloorButton.layer.borderWidth = 1
        firstFloorButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        secondFloorButton.backgroundColor = UIColor.clearColor()
        secondFloorButton.layer.cornerRadius = 5
        secondFloorButton.layer.borderWidth = 1
        secondFloorButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        thirdFloorButton.backgroundColor = UIColor.clearColor()
        thirdFloorButton.layer.cornerRadius = 5
        thirdFloorButton.layer.borderWidth = 1
        thirdFloorButton.layer.borderColor = UIColor.whiteColor().CGColor
        // Fristrations color in RGB percentages
        //view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if (uName == "n/a") {
            netIdLabel.text = "Not Signed In"
        }
        else {
            netIdLabel.text = uName
            if (casV != nil) {
                casV.removeFromSuperview()
            }
        }
    }
    
    
//    @IBAction func casSignOutPressed(sender: AnyObject) {
//        let netID: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("netid")
//        if (netID == nil) {
//            casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
//            casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.cs.princeton.edu/~cjhsu/fristrations/CASlogin.php")!))
//            casV.delegate = self
//            casV.layer.zPosition = 1
//            self.view.addSubview(casV)
//            signInButton.setTitle("Sign In", forState: .Normal)
//        }
//        else {
//            signInButton.setTitle("Sign In", forState: .Normal)
//            NSUserDefaults.standardUserDefaults().removeObjectForKey("netid")
//            casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
//            casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://fed.princeton.edu/cas/logout")!))
//            casV.delegate = self;
//            netIdLabel.text = "Not Signed In"
//            uName = "n/a"
//        }
//    }

    
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
    
    @IBAction func select100Level(sender: AnyObject) {
        if (uName == "n/a") {
            loginWarning()
        }
        else {
            performSegueWithIdentifier("firstFloor", sender: sender)
        }
    }
    
    @IBAction func select200Level(sender: AnyObject) {
        if (uName == "n/a") {
            loginWarning()
        }
        else {
            performSegueWithIdentifier("secondFloor", sender: sender)
        }
    }
    
    @IBAction func select300Level(sender: AnyObject) {
        if (uName == "n/a") {
            loginWarning()
        }
        else {
            performSegueWithIdentifier("thirdFloor", sender: sender)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                netIdLabel.text = uName
                UIView.animateWithDuration(0.5, animations: {self.casV!.alpha = 0}, completion: deleteAnimationComplete)
                NSUserDefaults.standardUserDefaults().setObject(netID, forKey: "netid")
            }
        }
        
    }
}

