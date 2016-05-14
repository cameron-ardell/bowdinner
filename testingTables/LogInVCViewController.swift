//
//  LogInVCViewController.swift
//  testingTables
//
//  Created by Marcus E. Christiansen on 5/7/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

class LogInVCViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!

    @IBAction func userLogIn(sender: UIButton) {
        
        let newUserName = username.text! as NSString
        let newPassword = password.text! as NSString
        
        if (newUserName == "" || newPassword == "") {
            let alertController = UIAlertController(title: "Sign In Failed", message: "Please enter username and password", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
}
