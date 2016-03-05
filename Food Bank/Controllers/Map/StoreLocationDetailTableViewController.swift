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
    
    var storeMapPin: MapPin?
    
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
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MapTableViewCell
            cell.configurate(storeMapPin)
            return cell
            
        case "directionCell":
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DirectionTableViewCell
            return cell
            
        case "phoneCell":
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PhoneTableViewCell
            return cell
            
        case "hoursCell":
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! HoursTableViewCell
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
