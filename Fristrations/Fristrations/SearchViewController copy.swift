//
//  SearchViewController.swift
//  Fristrations
//
//  Created by Stephanie Liu on 3/26/16.
//  Copyright © 2016 Stephanie Liu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    //@IBOutlet weak var searchBar: UIButton!
    //@IBOutlet weak var buildingTextField: UITextField!
    //@IBOutlet weak var buildingNameLabel: UILabel!

    @IBOutlet weak var floorPlan: UIImageView!
    

    // Called when the view controller’s content view is created and loaded from a storyboard
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "Search"
        // Fristrations color in RGB percentages
        view.backgroundColor = UIColor(red: 0.62, green: 0.773, blue: 0.843, alpha: 1.0)
        
        // Search bar
        let sampleTextField = UITextField(frame: CGRectMake(20, 100, 300, 40))
        sampleTextField.placeholder = "Search rooms"
        sampleTextField.font = UIFont.systemFontOfSize(15)
        sampleTextField.borderStyle = UITextBorderStyle.RoundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.No
        sampleTextField.keyboardType = UIKeyboardType.Default
        sampleTextField.returnKeyType = UIReturnKeyType.Done
        sampleTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        sampleTextField.delegate = self
        self.view.addSubview(sampleTextField)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions
//    func textFieldDidEndEditing(textField: UITextField) {
//        buildingNameLabel.text = textField.text
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
