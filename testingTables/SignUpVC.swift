//
//  SignUpVC.swift
//  testingTables
//
//  Created by Marcus E. Christiansen on 5/7/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!

    @IBOutlet weak var classYear: UITextField!
    
    @IBOutlet weak var Major: UITextField!
    
    @IBAction func userSignUp(sender: UIButton) {
        
        let newUserName = username.text! as NSString
        let newPassword = password.text! as NSString
        let confirmNewPassword = confirmPassword.text! as NSString
        
        if (newUserName == "" || newPassword == "") {
            let alertController = UIAlertController(title: "Sign Up Failed", message: "Username or Password can't be empty", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        else if (newPassword != confirmNewPassword) {
            let alertController = UIAlertController(title: "Sign Up Failed", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
        }
        
        else {
            
            
            
        }
        
    }
    
    
    @IBAction func signUpToLogIn(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
//    class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocal  {
//        
//        //Properties
//        
//        var feedItems: NSArray = NSArray()
//        var selectedLocation : LocationModel = LocationModel()
//        @IBOutlet weak var listTableView: UITableView!
//        
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            
//            //set delegates and initialize homeModel
//            
//            self.listTableView.delegate = self
//            self.listTableView.dataSource = self
//            
//            let homeModel = HomeModel()
//            homeModel.delegate = self
//            homeModel.downloadItems()
//            
//        }
//        
//        func itemsDownloaded(items: NSArray) {
//            
//            feedItems = items
//            self.listTableView.reloadData()
//        }
//        
//        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            // Return the number of feed items
//            return feedItems.count
//            
//        }
//        
//        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//            // Retrieve cell
//            let cellIdentifier: String = "BasicCell"
//            let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
//            // Get the location to be shown
//            let item: LocationModel = feedItems[indexPath.row] as! LocationModel
//            // Get references to labels of cell
//            myCell.textLabel!.text = item.address
//            
//            return myCell
//        }
//        
//    }
    
    
    
}
