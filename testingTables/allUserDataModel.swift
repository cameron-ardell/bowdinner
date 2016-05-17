//
//  homeModel.swift
//  testingTables
//
//  Created by Marcus E. Christiansen on 5/9/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import Foundation

protocol allUserDataProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class allUserDataModel: NSObject, NSURLSessionDataDelegate {
    
    weak var delegate: allUserDataProtocol!
    
    var data: NSMutableData = NSMutableData()
    
    let urlPath: String = "https://dev-student-apps.bowdoin.edu/mobilemeal/users.php"
    
    var users = [userModel]()
    
    func downloadData() {
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
        
        task.resume()
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data)
        
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }
        
        else {
            print("Data downloaded")
            self.parseJSON()
        }
    }
    
    func parseJSON() {
        
        var jsonResult = NSDictionary()
        
        do {
            jsonResult = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSDictionary
            
        } catch let error as NSError {
            print(error)
        }
        
        //print("WE ARE HERE")
        //print(jsonResult)
        
        var jsonResult2 = jsonResult["users"] as! [[String: AnyObject]]
        
        //print(jsonResult2)
        
        for i in 0 ..< jsonResult2.count {
            
            var jsonElement = jsonResult2[i]
            
            let user = userModel()
            
            let ID = (Int((jsonElement["id"] as? String)!)!)
            user.ID = ID
            
            
            if let firstName = jsonElement["firstName"] as? String {
                user.firstName = firstName
            }
            
            if let lastName = jsonElement["lastName"] as? String {
                user.lastName = lastName
            }
                
            if let year = jsonElement["year"] as? String {
                user.year = year
            }
            
            if let major = jsonElement["major"] as? String {
                user.major = major
            }
            
            let status1 = (Int((jsonElement["status1"] as? String)!)!)
            user.status1 = status1
            
            if let time1 = jsonElement["time1"] as? String {
                user.time1 = time1
            }
            if let place1 = jsonElement["place1"] as? String {
                user.place1 = place1
            }
            
            let status2 = (Int((jsonElement["status2"] as? String)!)!)
            user.status2 = status2
            
            if let time2 = jsonElement["time2"] as? String {
                user.time2 = time2
            }
            if let place2 = jsonElement["place2"] as? String {
                user.place2 = place2
            }
            
            let status3 = (Int((jsonElement["status3"] as? String)!)!)
            user.status3 = status3
            
            if let time3 = jsonElement["time3"] as? String {
                user.time3 = time3
            }
            if let place3 = jsonElement["place3"] as? String {
                user.place3 = place3
            }
            
            self.users.append(user)

            }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.delegate.itemsDownloaded(self.users)
        })
    
    }
}