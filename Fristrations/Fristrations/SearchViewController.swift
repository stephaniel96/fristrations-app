//
//  SearchViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 3/26/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UIButton!
    // MARK: Properties
    @IBOutlet weak var buildingTextField: UITextField!
    @IBOutlet weak var buildingNameLabel: UILabel!
    @IBOutlet weak var floorPlan: UIImageView!

    // Called when the view controller’s content view is created and loaded from a storyboard
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    override func viewWillLayoutSubviews() {
        if UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft || UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight {
            var rect = floorPlan.frame
            rect.origin.y = 130
            rect.origin.x = 149
            rect.size.width = 365
            rect.size.height = 235
            floorPlan.frame = rect
            
            rect = searchBar.frame
            rect.origin.y = 10
            rect.origin.x = 157
            rect.size.width = 343
            rect.size.height = 105
            searchBar.frame = rect
        }
        
        else {
            var rect = floorPlan.frame
            rect.origin.y = 310
            rect.size.width = 375
            rect.size.height = 304
            floorPlan.frame = rect
            
            rect = searchBar.frame
            rect.origin.y = 75
            rect.origin.x = 20
            rect.size.width = 343
            rect.size.height = 105
            searchBar.frame = rect
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions

    @IBAction func setBuildingLabel(sender: UIButton) {
        buildingNameLabel.text = "Default Text"
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
