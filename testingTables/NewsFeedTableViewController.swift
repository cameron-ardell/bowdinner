//
//  NewsFeedTableViewController.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/1/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

class NewsFeedTableViewController: UITableViewController, OtherProfileDataSource {

    //var myArray = ["hello world", "pineapple", "i am so stressed", "wow", "i might get this", "cool", "hi marcus!", "like what i've done with the place?"]
    
    var statusArray = [["Sophie Ardell", "11:30 AM", "1 PM", "Moulton mother fucker"], ["Marcus Christiansen", "9:30 AM", "10 AM", "Thorne"]]
    
    var allFriendsArray = [["Sophie Ardell", "2017", "Physics and Computer Science", "Load short bio that they fill in here. And now I need to add more words because xcode is having an autolayout bitch fit. This is sort of frustrating. Stupid autolayout is so stupid."], ["Marcus Christiansen", "2017", "Computer Science", "Ariana Grande is dank"]]
    
    
    //checks if user has friend with specific name
    func profileInfo(name: String) -> [String]? {
        for i in 0...allFriendsArray.count-1 {
            if allFriendsArray[i][0] == name {
                //if name is found, return profile information
                return allFriendsArray[i]
            }
        }
        
        return nil
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.separatorColor = UIColor.purpleColor()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return statusArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let individual = statusArray[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! NewsFeedTableViewCell
        
       // cell.statusInformation = [individual[0], individual[1], individual[2], individual[3]]
        
        cell.personName = individual[0]
        
        cell.myLabel.text = individual[0] + " is available from " + individual[1] + " to " + individual[2] + "!\nDining location preference: " + individual[3] + "."
        cell.myLabel.adjustsFontSizeToFitWidth = true

        
        
        
        

        return cell
    }
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
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
