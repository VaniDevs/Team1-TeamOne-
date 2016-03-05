//
//  MapPin.swift
//  Food Bank
//
//  Created by Evian on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import Foundation
import MapKit

class MapPin : NSObject, MKAnnotation {
    
    var myCoordinate: CLLocationCoordinate2D
    var title: String?
    var address: String?
    var phone: String?
    var hours: [String]?
    
    init(myCoordinate: CLLocationCoordinate2D) {
        self.myCoordinate = myCoordinate
    }
    
    var coordinate: CLLocationCoordinate2D {
        return myCoordinate
    }
    
    
}