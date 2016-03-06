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
    
    static let kAppID = "82130a63"
    static let kAppKey = "0a9e1ebf4ce1bd6406fd46c0866470f6"
    
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
        let urlKeyword = keyword.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        let url = "https://api.nutritionix.com/v1_1/search/\(urlKeyword)?results=0%3A20&cal_min=0&cal_max=50000&fields=item_name%2Cbrand_name%2Citem_id%2Cbrand_id&appId=\(kAppID)&appKey=\(kAppKey)"
        print(url)
        Alamofire.request(.GET, url).responseJSON { response in
            
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