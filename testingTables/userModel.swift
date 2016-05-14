//
//  userModel.swift
//  testingTables
//
//  Created by Marcus E. Christiansen on 5/9/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import Foundation

class userModel: NSObject {
    
    var ID: Int?
    var email: String?
    var password: String?
    var name: String?
    var year: Int?
    var major: String?
    var status: Int? //Bit. 1 = True. 0 = False.
    var time: String?
    var place: String?
    //var bio: String?
    
    override init() {
    }
    
    init(ID:Int, email: String, password: String, name:String, year:Int, major:String, status:Int, time:String, place: String) {
        self.ID = ID
        self.email = email
        self.password = password
        self.name = name
        self.year = year
        self.major = major
        self.status = status
        self.time = time
        self.place = place
        //self.bio = bio

    }
    
    override var description: String {
        return "ID: \(ID), Email: \(email), Name: \(name), Year: \(year), Major: \(major) Status: \(status), Time: \(time), Place: \(place)"
    }
    
}