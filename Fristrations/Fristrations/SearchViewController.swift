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
    @IBOutlet weak var buildingTextField: UITextField!
    @IBOutlet weak var buildingNameLabel: UILabel!
    

    // Called when the view controller’s content view is created and loaded from a storyboard
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field’s user input through delegate callbacks.
        buildingTextField.delegate = self
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
    
    func textFieldDidEndEditing(textField: UITextField) {
        buildingNameLabel.text = textField.text
    }
    
    
    
    
    
    // MARK: Actions
    @IBAction func setBuildingLabel(sender: AnyObject) {
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
