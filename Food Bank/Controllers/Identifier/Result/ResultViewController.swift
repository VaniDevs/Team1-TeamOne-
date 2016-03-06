//
//  ResultViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class ResultViewController: FoodStatsTableViewController {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemBrandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupData() {
        super.setupData()
        
        if let itemName = item.itemName {
            itemNameLabel.text = itemName
        }
        if let brandName = item.brandName {
            itemBrandLabel.text = brandName
        }
    }
    
    @IBAction func addToDonation(sender: AnyObject) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self.item)
        }
    }
}
