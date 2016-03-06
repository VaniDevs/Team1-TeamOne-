//
//  MapPin.swift
//  Food Bank
//
//  Created by Evian on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import Foundation
import MapKit
import ObjectMapper

class MapPin : NSObject, MKAnnotation, Mappable {
    
    var pinCoordinate: CLLocationCoordinate2D
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    var title: String?
    var address: String?
    var placeId: String?
    
    override init() {
        self.pinCoordinate = CLLocationCoordinate2D()
        super.init()
    }
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    init(coordinate: CLLocationCoordinate2D) {
        self.pinCoordinate = coordinate
    }
    
    var coordinate: CLLocationCoordinate2D {
        if latitude != nil && longitude != nil {
            return CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        }
        return pinCoordinate
    }
    
    func mapping(map: Map) {
        latitude <- map["geometry.location.lat"]
        longitude <- map["geometry.location.lng"]
        title <- map["name"]
        address <- map["formatted_address"]
        placeId <- map["place_id"]
    }
}
