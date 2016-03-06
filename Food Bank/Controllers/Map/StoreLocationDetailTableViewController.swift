//
//  StoreLocationDetailTableViewController.swift
//  Food Bank
//
//  Created by Evian on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import CoreLocation

class StoreLocationDetailTableViewController: UITableViewController {

    let cellIdentifierList = ["mapCell", "directionCell", "phoneCell", "hoursCell"]
    
    var storeMapPin: MapPin?
    var userLocation: CLLocation?
    
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
            cell.configure(storeMapPin)
            return cell
            
        case "directionCell":
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DirectionTableViewCell
            cell.configure(storeMapPin, userLocation: userLocation)
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        let cellIdentifier = cellIdentifierList[index]
        
        switch cellIdentifier {
        case "directionCell":
            openMap()
        case "phoneCell":
            makePhoneCall()
        default:
            break
        }
    }
    
    private func openMap() {
        let dCoordinate = storeMapPin?.coordinate
        if let sCoordinate = userLocation?.coordinate {
            if let url = NSURL(string: "http://maps.google.com/maps?saddr=\(sCoordinate.latitude),\(sCoordinate.longitude)&daddr=\(dCoordinate?.latitude),\(dCoordinate?.longitude)") {
                UIApplication.sharedApplication().openURL(url)
            }
        } else {
            if let url = NSURL(string: "http://maps.google.com/maps?z=10&t=m&q=loc:\(Double((dCoordinate?.latitude)!))+\(Double((dCoordinate?.longitude)!))") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    private func makePhoneCall() {
        
    }
}
