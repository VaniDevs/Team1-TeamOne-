//
//  DirectionTableViewCell.swift
//  Food Bank
//
//  Created by Evian on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import CoreLocation

class DirectionTableViewCell: UITableViewCell {

    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(pin: MapPin?, userLocation: CLLocation?) {
        if let pin = pin {
            address.text = pin.address
            if let currentLocation = userLocation {
                let storeLocation = CLLocation(latitude: pin.myCoordinate.latitude, longitude: pin.myCoordinate.longitude)
                let distanceToStore = currentLocation.distanceFromLocation(storeLocation)
                distance.text = NSString(format:"%.2f km", distanceToStore/1000) as String
            }
        } else {
            distance.text = ""
        }
    }
    
    
}
