//
//  MoreViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 4/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Kanna
import Foundation

class MoreViewController: UIViewController, UIWebViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // button image
        let facebookIcon = UIImage.init(named: "facebook-icon")
        facebookButton.setBackgroundImage(facebookIcon, forState: .Normal)
        facebookButton.setTitle(nil, forState: .Normal)
        facebookButton.contentMode = UIViewContentMode.ScaleAspectFill
        
        // Do any additional setup after loading the view.
        self.title = "More"
        // Fristrations color in RGB percentages
        view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
    }
    
    
    @IBAction func facebookButtonPressed(sender: UIButton) {

        // code to try to handle case where person has facebook app installed
        let facebookURL = NSURL(string: "https://www.facebook.com/1607764632876387")
        if (UIApplication.sharedApplication().canOpenURL(facebookURL!)) {
            UIApplication.sharedApplication().openURL(facebookURL!)
        }
        else {
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/1607764632876387")!)
        }
    }
    
//    @IBAction func websiteButtonPressed(sender: UIButton) {
//    }
    
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
    
}
