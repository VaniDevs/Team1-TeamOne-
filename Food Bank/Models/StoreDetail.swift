//
//  StoreDetail.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-06.
//  Copyright © 2016 Team1. All rights reserved.
//

import Foundation
import ObjectMapper

class StoreDetail : MapPin {

    var phone: String?
    var hours: [String]?
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        
        phone <- map["formatted_phone_number"]
        hours <- map["opening_hours.weekday_text"]
    }

}
