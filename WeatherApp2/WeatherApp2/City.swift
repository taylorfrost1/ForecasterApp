//
//  City.swift
//  WeatherApp2
//
//  Created by Taylor Frost on 6/23/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class City: NSObject {
    
    var name: String = ""
    var zipCode: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    
    override init() {
        super.init()
    }
    
    init (name: String, zipcode: String, latitude: Double, longitude: Double){
        self.name = name
        self.zipCode = zipcode
        self.latitude = latitude
        self.longitude = longitude
    }

}
