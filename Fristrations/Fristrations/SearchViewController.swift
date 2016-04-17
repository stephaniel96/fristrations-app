//
//  SearchViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 3/26/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Firebase

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    var rootRef: Firebase!
    var currentTime:String
    var roomURL:String = "https://fristrations.firebaseio.com/rooms"
    let rooms = [114, 205, 206, 207, 208, 209, 210, 212, 227, 228, 234, 303, 307, 309]
    var availableRooms:[String] = []
    // Called when the view controller’s content view is created and loaded from a storyboard
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Available Rooms"
        // Fristrations color in RGB percentages
        view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)

        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Minute , .Hour], fromDate: date)
        let minute =  components.minute
        let hour = components.hour
        
        currentTime = String(hour) + String(minute)
        
        
        
        
        //for number in rooms {
       //     roomRef = Firebase(url:(roomURL + roomNumber))
       //     if
       // }
        
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
