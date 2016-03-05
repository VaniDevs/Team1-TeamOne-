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
        let cellIdentifier = cellIdentifierList[index]
        
        switch cellIdentifier {
        case "mapCell":
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MapTableViewCell
            return cell
            
        case "directionCell":
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
            return cell
            
        case "phoneCell":
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
            return cell
            
        case "hoursCell":
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let index = indexPath.row
        let cellIdentifier = cellIdentifierList[index]
        
        switch cellIdentifier {
        case "mapCell":
            return 250.0
        case "directionCell":
            return 100.0
        case "phoneCell":
            return 70.0
        case "hoursCell":
            return 210.0
        default:
            return 0
        }
    }
}
