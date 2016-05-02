//
//  MoreViewController.swift
//  Fristrations
//
//  Created by Chris Hsu on 4/29/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Kanna
import Foundation

class MoreViewController: UITableViewController,  UIWebViewDelegate{
    
    @IBOutlet weak var signInStatus: UILabel!
    @IBOutlet weak var signInButton: UILabel!
    
    var casV: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Settings"
        // Fristrations color in RGB percentages
        view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        if (uName == "n/a") {
            signInStatus.text = "No User Signed In"
            signInButton.text = "Sign In"
        }
        else {
            signInStatus.text = "Signed in as: \(uName)"
            signInButton.text = "Sign Out"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        // CAS Sign-In
        if (indexPath.section == 0 && indexPath.row == 1) {
            
            let netID: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("netid")
            if (netID == nil) {
                casV = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
                casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.cs.princeton.edu/~cjhsu/fristrations/CASlogin.php")!))
                casV.delegate = self
                casV.layer.zPosition = 1
                self.view.addSubview(casV)
                signInButton.text = "Sign In"
            }
            else {
                let alertController = UIAlertController(title: "Sign Out", message:
                    "Are you sure you want to sign out? You will not be able to reserve rooms until you sign back in with a valid netID.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                alertController.addAction(UIAlertAction(title: "Sign Out", style: UIAlertActionStyle.Default,handler: {action in
                    self.signInButton.text = "Sign In"
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("netid")
                    self.casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
                    self.casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://fed.princeton.edu/cas/logout")!))
                    self.casV.delegate = self;
                    self.signInStatus.text = "Not Signed In"
                    uName = "n/a"
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        // Share Fristrations
        if (indexPath.section == 1 && indexPath.row == 0) {
            let textToShare = "Fristrations is awesome!  Check out this website about it!"
            
            if let myWebsite = NSURL(string: "https://fristrations.xyz/") {
                let objectsToShare = [textToShare, myWebsite]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                // Excluded Activities for sharing
                activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
                
                self.presentViewController(activityVC, animated: true, completion: nil)
            }
        }
        // Check out our website
        else if (indexPath.section == 1 && indexPath.row == 1) {
            UIApplication.sharedApplication().openURL(NSURL(string: "https://fristrations.xyz/")!)
        }
        // Contact us by email
        else if (indexPath.section == 1 && indexPath.row == 2) {
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/1607764632876387")!)
        }
        // Share Fristrations
        else if (indexPath.section == 1 && indexPath.row == 3) {
            let email = "kjb3@princeton.edu"
            let url = NSURL(string: "mailto:\(email)")
            UIApplication.sharedApplication().openURL(url!)
        }
        
        // COS 333
        else if (indexPath.section == 2 && indexPath.row == 0) {
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.cs.princeton.edu/courses/archive/spring16/cos333/index.html")!)
        }

    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("Webview fail with error \(error)");
    }
    
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("Webview started Loading")
    }
    
    func deleteAnimationComplete(value: Bool)
    {
        if (value && casV != nil)
        {
            casV.removeFromSuperview()
            casV = nil
        }
        
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
                signInStatus.text = "Logged in as: " + uName
                signInButton.text = "Sign Out"
                UIView.animateWithDuration(0.5, animations: {self.casV!.alpha = 0}, completion: deleteAnimationComplete)
                NSUserDefaults.standardUserDefaults().setObject(netID, forKey: "netid")
            }
        }
        
    }
    
}