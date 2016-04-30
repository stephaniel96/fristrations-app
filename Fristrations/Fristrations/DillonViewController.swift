//
//  DillonViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 3/26/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit
import Firebase

class DillonViewController: UIViewController {
    
    var dillonURL:String = "https://fristrations.firebaseio.com/dillon_gym/num_devices"
    var dillonRef: Firebase!
    var population:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        // Fristrations color in RGB percentages
        view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
        
        let dillonRouter = Firebase(url:dillonURL)
        dillonRouter.observeEventType(.Value, withBlock: {
            snapshot in
            self.population = Int(snapshot.value as! String)!
        
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
