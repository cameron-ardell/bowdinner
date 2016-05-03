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
    func profileInfo(name: String) -> [String]?
}

class OtherProfileViewController: UIViewController{

    weak var dataSource: OtherProfileDataSource?
    
    var profileInformation: [String]?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var classYear: UILabel!
    @IBOutlet weak var majors: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    var nameString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = nameString
        
        profileInformation = dataSource?.profileInfo(name.text!)
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
            classYear.text = profileInformation![1]
            majors.text = profileInformation![2]
            bio.text = profileInformation![3]
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController
        
        if let hvc = destination as? RandomizeViewController {
            
            if let identifier = segue.identifier {
                
                if identifier == "inviteSpecificPersonSegue" {
                    hvc.typeOfInvite = "Invite \(profileInformation![0])!"
                }
                
            }
            
        }
    }
    

}
