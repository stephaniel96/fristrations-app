//
//  NearbyViewController.swif
//  initially named FirstViewController.swif
//  Fristrations
//
//  Created by Stephanie Liu on 3/24/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class NearbyViewController: UIViewController {
    
    var ref = Firebase(url: "https://fristrations.firebaseio.com/")
    var carol = ["full_name": "Carol Louie", "date_of_birth": "May 20, 1987"]
    var brian = ["full_name": "Brian Best", "date_of_birth": "May 17, 1989"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Nearby"
        // Fristrations color in RGB percentages
        view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
        
        // Testing firebase
        let usersRef = ref.childByAppendingPath("users")
        usersRef.removeValue()
        let users = ["carol": carol, "brian": brian]
        usersRef.setValue(users)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

