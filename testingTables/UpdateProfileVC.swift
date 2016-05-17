//
//  UpdateProfileVC.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/10/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

class UpdateProfileVC: UIViewController, NSURLSessionDelegate {
    
    
    @IBOutlet weak var userNewPassword: UITextField!
    @IBOutlet weak var userConfirmNewPassword: UITextField!
    @IBOutlet weak var userNewClassYear: UITextField!
    @IBOutlet weak var userNewMajor: UITextField!
    @IBOutlet weak var userNewBio: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMain(sender: UIButton) {
        
        let newPassword = userNewPassword.text! as String
        let newConfirmPassword = userConfirmNewPassword.text! as String
        let newClassYear = userNewClassYear.text! as String
        let newMajor = userNewMajor.text! as String
        let newBio = userNewBio.text! as String
        
        //let userID = ......
        
        if (newPassword != newConfirmPassword) {
            let alertController = UIAlertController(title: "Sign Up Failed", message: "Passwords Must Match", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        else {
            
            let alertController = UIAlertController(title: "Success", message: "Profile Changed", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            let presentingVC = self.presentingViewController
            self.dismissViewControllerAnimated(true, completion: {
                presentingVC!.dismissViewControllerAnimated(false, completion: {})
            })
            
            
        }
        
    }

    func updateProfile(newUserFirstName:String, newUserLastName:String, newUserClassYear:String, newUserMajor:String, newUserBio: String, userID: Int) {
        
        let url:String = "https://dev-student-apps.bowdoin.edu/mobilemeal/updateInfo.php"
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        request.HTTPMethod = "POST"
        let postString = "a=\(newUserFirstName)&b=\(newUserLastName)&c=\(newUserClassYear)&f=\(newUserMajor)&g=\(userID)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            
            if let data = data, _ = NSString(data:data, encoding: NSUTF8StringEncoding)
                where error == nil {
                    print("no error")
            }
                
            else {
                print("error")
            }
            
        }
        
        task.resume()
        
    }

}
