//
//  MapTableViewCell.swift
//  Food Bank
//
//  Created by Evian on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {

    @IBOutlet var storeMapView: MKMapView!
    
    var storePin: MapPin?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(pin: MapPin?) {
        if let pin = pin {
            storeMapView.addAnnotation(pin)
            let coordinate = pin.myCoordinate
            let span = MKCoordinateSpanMake(0.1, 0.1)
            storeMapView.setRegion(MKCoordinateRegion(center: coordinate, span: span), animated: true)
        }
    }
}
