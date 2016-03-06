//
//  DataStore.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class DataStore {
    
    static let topFoods = ["Canned fish or meats",
        "Canned beans, kidney, black bean, chickpeas",
        "100% nut butters",
        "Pasta and rice",
        "Canned vegetables, pasta sauces",
        "Canned fruit, packed in its own juice or water",
        "Whole grain breakfast cereals",
        "Hearty soups, stews and chili"]
    
    class func updateTopFoods() {
        let realm = try! Realm()
        if (realm.objects(TopFood).count == 0) {
            for food in DataStore.topFoods {
                APIClient.search(keyword: food, results: { (results) -> () in
                    if let result = results?.first {
                        if let fields = result["fields"] as? [String: AnyObject] {
                            if let item = Mapper<SearchItem>().map(fields) {
                                APIClient.search(itemId: item.id!, result: { (detail) -> () in
                                    if let detail = detail {
                                        if let topItem = Mapper<TopFood>().map(detail) {
                                            topItem.desc = food
                                            try! realm.write({ () -> Void in
                                                realm.add(topItem)
                                            })
                                        }
                                    }
                                })
                            }
                        }
                    }
                })
            }
        }
    }
}