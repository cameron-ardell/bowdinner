//
//  NewsFeedTableViewController.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/1/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

class NewsFeedTableViewController: UITableViewController, OtherProfileDataSource, allUserDataProtocol {
    
    var feedItems: NSArray = NSArray()
    
    let userDataModel = allUserDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDataModel.delegate = self
        userDataModel.downloadData()
    }
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
    }
    
    var statusArray = [userModel]()
    
    var users = [String: userModel]()
    
    //checks if user has friend with specific name
    func profileInfo(name: [String]) -> userModel? {
        for i in 0...statusArray.count-1 {
            if statusArray[i].firstName == name[0] && statusArray[i].lastName == name[1] {
                //if name is found, return profile information
                return statusArray[i]
            }
        }
        
        return nil
    }
    
    @IBAction func refresh(sender: UIRefreshControl) {
        
        //statusArray.removeAll()
//        feedItems = []
//        
        //userDataModel.downloadData()
        
        print(feedItems.count)
//        
        if (feedItems.count != 0) {
            for i in 0...feedItems.count-1 {
                statusArray.append(feedItems[i] as! userModel)
                
            }
        }
//
        self.tableView.reloadData()
        
        sender.endRefreshing()
    }
    
    var signedIn: Bool = false
    
    override func viewDidAppear(animated: Bool) {
        
        if (signedIn == false) {
            self.performSegueWithIdentifier("goToLogin", sender: self)
            signedIn = true
        }
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //if (signedIn) {
        
            // Configure the cell...
            let individual = statusArray[indexPath.row]
            
            let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! NewsFeedTableViewCell
        
            //cell.statusInformation = [individual[0], individual[1], individual[2], individual[3]]
        
            cell.personName = [individual.firstName!, individual.lastName!]
        
            cell.userName.text = "\(individual.firstName!), \(individual.lastName!)"
        
            if individual.status1 == 0 {
                cell.userAvailability.text = "Unavailable"
                cell.userLocation.text = " "
                cell.userTime.text = " "
            } else {
                cell.userAvailability.text = "Available"
                cell.userLocation.text = "\(individual.place1!)"
                cell.userTime.text = "\(individual.time1!)"
            }
        
            cell.userName.adjustsFontSizeToFitWidth = true
            cell.userAvailability.adjustsFontSizeToFitWidth = true
            cell.userTime.adjustsFontSizeToFitWidth = true
            cell.userLocation.adjustsFontSizeToFitWidth = true
            
        return cell
            
        //}
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! NewsFeedTableViewCell
        
        //return cell
            
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var destination = segue.destinationViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController!
        }
       
        if let hvc = destination as? OtherProfileViewController {
        
            if let identifier = segue.identifier{
            
                if identifier == "ShowOtherProfileSegue" {
                    let seletectedIndexPath = tableView.indexPathForCell(sender as! NewsFeedTableViewCell)
                    let currentCell = tableView.cellForRowAtIndexPath((seletectedIndexPath)!) as? NewsFeedTableViewCell
                    hvc.dataSource = self
                    hvc.nameString = currentCell?.personName
  
                }
        
            }
        }
    }
    

}
