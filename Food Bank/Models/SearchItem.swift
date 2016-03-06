//
//  SearchItem.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchItem: Mappable {
    
    var brandName: String?
    var itemName: String?
    var id: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        brandName <- map["brand_name"]
        itemName <- map["item_name"]
        id <- map["item_id"]
    }
}