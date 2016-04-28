
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

class BrowseViewController: UIViewController, UIWebViewDelegate{
    
    @IBOutlet weak var fristLabel: UILabel!
    @IBOutlet weak var firstFloorButton: UIButton!
    @IBOutlet weak var secondFloorButton: UIButton!
    @IBOutlet weak var thirdFloorButton: UIButton!
    @IBOutlet weak var casButton: UIButton!
    @IBOutlet weak var netIdLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!

    
    var casV: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Browse"
        
        
        // BACKGROUND
//        self.view.backgroundColor = UIColor(red: 180/250.0, green: 4/250.0, blue: 78/250.0, alpha: 1)
        self.view.backgroundColor = UIColor(red: 0.32, green: 0.473, blue: 0.643, alpha: 1)
        
        let netID: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("netid")
        
        if (netID == nil) {
            casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
            casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.cs.princeton.edu/~cjhsu/fristrations/CASlogin.php")!))
            casV.delegate = self;
            casV.layer.zPosition = 1
            self.view.addSubview(casV)
            netIdLabel.text = "Not Signed In"
            signInButton.setTitle("Sign In", forState: .Normal)
        }
        else {
            uName = netID as! String
            netIdLabel.text = "Logged in as: " + uName
            signInButton.setTitle("Sign Out", forState: .Normal)
        }
        
        signInButton.backgroundColor = UIColor.clearColor()
        signInButton.layer.cornerRadius = 5
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.whiteColor().CGColor
        
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
    
    
    @IBAction func casSignOutPressed(sender: AnyObject) {
        let netID: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("netid")
        if (netID == nil) {
            casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
            casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.cs.princeton.edu/~cjhsu/fristrations/CASlogin.php")!))
            casV.delegate = self
            casV.layer.zPosition = 1
            self.view.addSubview(casV)
            signInButton.setTitle("Sign In", forState: .Normal)
        }
        else {
            signInButton.setTitle("Sign In", forState: .Normal)
            NSUserDefaults.standardUserDefaults().removeObjectForKey("netid")
            casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
            casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://fed.princeton.edu/cas/logout")!))
            casV.delegate = self;
            netIdLabel.text = "Not Signed In"
            uName = "n/a"
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
                netIdLabel.text = "Logged in as: " + uName
                signInButton.setTitle("Sign Out", forState: .Normal)
                UIView.animateWithDuration(0.5, animations: {self.casV!.alpha = 0}, completion: deleteAnimationComplete)
                NSUserDefaults.standardUserDefaults().setObject(netID, forKey: "netid")
            }
        }
        
    }
}

