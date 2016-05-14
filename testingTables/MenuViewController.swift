//
//  MenuViewController.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/3/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFriendLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        updateStatusLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        profileSettingsLabel.titleLabel?.adjustsFontSizeToFitWidth = true
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var addFriendLabel: UIButton!
    @IBOutlet weak var updateStatusLabel: UIButton!
    @IBOutlet weak var profileSettingsLabel: UIButton!
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
