//
//  ProfileViewController.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/1/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

//gives individual username so their information can be found on server
//if user chooses to segue to their profile
protocol OtherProfileDataSource: class {
    func profileInfo(name: [String]) -> [String]?
}

class OtherProfileViewController: UIViewController{

    weak var dataSource: OtherProfileDataSource?
    
    var profileInformation: [String]?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var classYear: UILabel!
    @IBOutlet weak var majors: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    var nameString: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = nameString![0] + " " + nameString![1]
        
        profileInformation = dataSource?.profileInfo(nameString!)
        self.title = name.text
        self.setLabels()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUsername(named: String) {
        name.text = named
    }
    
    func setLabels() {
        
        if !profileInformation!.isEmpty {
            classYear.text = profileInformation![2]
            majors.text = profileInformation![3]
            bio.text = profileInformation![4]
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destination = segue.destinationViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController!
        }

        
        if let hvc = destination as? InvitePersonViewController {
            
            if let identifier = segue.identifier {
                
                if identifier == "inviteSpecificPersonSegue" {
                    hvc.typeOfInvite = "Invite \(profileInformation![0])!"
                    hvc.userInvited = nameString![0] + " " + nameString![1]
                }
                
            }
            
        }
    }
    

}
