
//
//  NearbyViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SafariServices

var uName:String = "n/a"
let kSafariViewControllerCloseNotification = "kSafariViewControllerCloseNotification"

class NearbyViewController: UIViewController, UIWebViewDelegate,SFSafariViewControllerDelegate,FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var fristLabel: UILabel!
    @IBOutlet weak var firstFloorButton: UIButton!
    @IBOutlet weak var secondFloorButton: UIButton!
    @IBOutlet weak var thirdFloorButton: UIButton!
    @IBOutlet weak var casButton: UIButton!
    
    var casV: SFSafariViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Nearby"
        // Fristrations color in RGB percentages
        //view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
        
        //Checks if there is an instance of a logged in user
//        if (FBSDKAccessToken.currentAccessToken() != nil)
//        {
//            // User is already logged in, do work such as go to next view controller.
//            returnUserData()
//        }
//        else
//        {
//            //Creates a login button that opens a new view if not the case
//            let loginView : FBSDKLoginButton = FBSDKLoginButton()
//            self.view.addSubview(loginView)
//            let topconstraint = NSLayoutConstraint(item: loginView, attribute: NSLayoutAttribute.TopMargin, relatedBy: .Equal, toItem: thirdFloorButton, attribute:NSLayoutAttribute.BottomMargin, multiplier: 1.0, constant: 20)
//            
//            self.view.addConstraint(topconstraint)
//            loginView.center = self.view.center
//            
//            loginView.readPermissions = ["public_profile", "email"]
//            loginView.delegate = self
//        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(NearbyViewController.casLogin(_:)), name: kSafariViewControllerCloseNotification, object: nil)

        
    }
    
    func casLogin(notification: NSNotification) {
        // get the url form the auth callback
        let url = notification.object as! NSURL
        print(String(url))
        print("logged in")
        // then do whatever you like, for example :
        // get the code (token) from the URL
        // and do a request to get the information you need (id, name, ...)
        // Finally dismiss the Safari View Controller with:
        self.casV!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {

            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                uName = userName as String
            }
        })
    }
    
    
    @IBAction func casPressed(sender: AnyObject) {
        casV = SFSafariViewController(URL: NSURL(string: "https://fed.princeton.edu/cas/v1/tickets")!)
        casV?.delegate = self
        self.presentViewController(casV!, animated: true, completion: nil)
   
    }
    
    func webViewDidFinishLoad(webView: UIWebView!) {
        
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // pass data to next controller
//        if segue == "secondFloor"
//        {
//            let destVC = segue.destinationViewController as! SecondFloor
//            destVC.
//        }
//    
//    }

    
}

