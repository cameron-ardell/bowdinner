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
    var firstName: String?
    var lastName: String?
    var year: Int?
    var major: String?
    var bio: String?
    
    
    var statusOne: Int? //Bit. 1 = True. 0 = False.
    var timeOne: String?
    var placeOne: String?
    
    override init() {
    }
    
    init(ID:Int, email: String, password: String, firstName:String, lastName: String, year:Int, major:String, bio: String, statusOne:Int, timeOne:String, placeOne: String) {
        self.ID = ID
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.year = year
        self.major = major
        self.statusOne = statusOne
        self.timeOne = timeOne
        self.placeOne = placeOne
        self.bio = bio

    }
    
    override var description: String {
        //return "ID: \(ID), Email: \(email), Name: \(name), Year: \(year), Major: \(major) Status: \(status), Time: \(time), Place: \(place)"
        return "ID: \(ID), Email: \(email), Name: \(firstName) \(lastName), Year: \(year), Major: \(major), Bio \(bio), Status: \(statusOne), Time: \(timeOne), Place: \(placeOne)"
    }
    
}