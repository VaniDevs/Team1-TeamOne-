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
    
    class func search(barcode code: String, result: NSDictionary? -> ()) {
        Alamofire.request(.GET, "https://api.nutritionix.com/v1_1/item?upc=\(code)&appId=\(kAppID)&appKey=\(kAppKey)").responseJSON { response in
            
            if let dict = response.result.value as? NSDictionary {
                result(dict)
            }
            else {
                result(nil)
            }
        }
    }
    
    class func search(keyword keyword: String, results: [NSDictionary]? -> ()) {
        
    }
}

//curl -v  -X GET "https://api.nutritionix.com/v1_1/item?upc=0737628005000&appId=82130a63&appKey=0a9e1ebf4ce1bd6406fd46c0866470f6"
//ps://api.nutritionix.com/v1_1/search/cheddar%20cheese?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=82130a63&appKey=0a9e1ebf4ce1bd6406fd46c0866470f6

