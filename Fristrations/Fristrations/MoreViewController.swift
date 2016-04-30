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
    
    // testing push
    
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
                signInButton.text = "Sign In"
                NSUserDefaults.standardUserDefaults().removeObjectForKey("netid")
                casV = UIWebView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
                casV.loadRequest(NSURLRequest(URL: NSURL(string: "https://fed.princeton.edu/cas/logout")!))
                casV.delegate = self;
                signInStatus.text = "Not Signed In"
                uName = "n/a"
            }
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