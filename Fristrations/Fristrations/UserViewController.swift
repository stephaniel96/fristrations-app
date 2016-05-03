//
//  UserViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 5/2/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var seg_ctrler: UIToolbar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var reservationsView: UIView!
    @IBOutlet weak var favoritesView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Rooms"
        // Do any additional setup after loading the view.
    }

    
    @IBAction func switchViews(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.reservationsView.alpha = 1
                self.favoritesView.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.reservationsView.alpha = 0
                self.favoritesView.alpha = 1
            })
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

}
