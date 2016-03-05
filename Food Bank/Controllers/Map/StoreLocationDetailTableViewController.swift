//
//  StoreLocationDetailTableViewController.swift
//  Food Bank
//
//  Created by Evian on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit

class StoreLocationDetailTableViewController: UITableViewController {

    let cellIdentifierList = ["mapCell", "directionCell", "phoneCell", "hoursCell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIdentifierList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        switch index {
        case 0:
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierList[index], forIndexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
