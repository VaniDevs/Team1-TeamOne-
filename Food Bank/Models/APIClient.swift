//
//  APIClient.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static let kAppID = "fe0e03dc"
    static let kAppKey = "58adb20da42673f6e36e3ca4ff24439d"
    
    class func search(barcode code: String, result: [String: AnyObject]? -> ()) {
        Alamofire.request(.GET, "https://api.nutritionix.com/v1_1/item?upc=\(code)&appId=\(kAppID)&appKey=\(kAppKey)").responseJSON { response in
            result(response.result.value as? [String: AnyObject])
        }
    }
    
    class func search(itemId id: String, result: [String: AnyObject]? -> ()) {
        Alamofire.request(.GET, "https://api.nutritionix.com/v1_1/item?id=\(id)&appId=\(kAppID)&appKey=\(kAppKey)").responseJSON { response in
            result(response.result.value as? [String: AnyObject])
        }
    }
    
    class func search(keyword keyword: String, results: [[String: AnyObject]]? -> ()) {
        Alamofire.request(.GET, "https://api.nutritionix.com/v1_1/search/\(keyword)?results=0%3A20&cal_min=0&cal_max=50000&fields=item_name%2Cbrand_name%2Citem_id%2Cbrand_id&appId=\(kAppID)&appKey=\(kAppKey)").responseJSON { response in
            
            if let dict = response.result.value as? [String: AnyObject] {
                if let items = dict["hits"] as? [[String: AnyObject]] {
                    results(items)
                    return
                }
            }
            
            results(nil)
        }
    }
}