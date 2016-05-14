//
//  homeModel.swift
//  testingTables
//
//  Created by Marcus E. Christiansen on 5/9/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HomeModel: NSObject, NSURLSessionDataDelegate {
    
    weak var delegate: HomeModelProtocol!
    
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
        
        var jsonResult2 = jsonResult["users"] as! [[String: AnyObject]]
        
        for (var i = 0; i < jsonResult2.count; i++) {
            
            var jsonElement = jsonResult2[i]
            
            let user = userModel()
            
            let ID = (Int((jsonElement["id"] as? String)!)!)
            user.ID = ID
            
            if let email = jsonElement["email"] as? String {
                user.email = email
            }
            
            if let name = jsonElement["name"] as? String {
                user.name = name
            }
                
            let year = (Int((jsonElement["year"] as? String)!)!)
            user.year = year
            
            if let major = jsonElement["major"] as? String {
                user.major = major
            }
            
            let status = (Int((jsonElement["status"] as? String)!)!)
            user.status = status
            
            if let time = jsonElement["time"] as? String {
                user.time = time
            }
            if let place = jsonElement["place"] as? String {
                user.place = place
            }
            
            self.users.append(user)

            }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.delegate.itemsDownloaded(self.users)
        })
    
    }
}