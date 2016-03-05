//
//  MapViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var storeLocationMapView: MKMapView!
    
    let addressBook = [
        "370 E Broadway, Vancouver",
        "1675 Robson Street, Vancouver",
        "2285 W 4th Avenue, Vancouver"
    ]
    
    override func viewDidLoad() {
        loadStoreLocations()

        super.viewDidLoad()
        
        let initLocation = CLLocationCoordinate2D(
            latitude: 49.25,
            longitude: -123.12
        )
        let span = MKCoordinateSpanMake(0.5, 0.5)
        storeLocationMapView.setRegion(MKCoordinateRegion(center: initLocation, span: span), animated: true)
        
    }
    
    private func loadStoreLocations() {
        for address in addressBook {
            CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
                if error != nil {
                    print(error)
                    return
                }
                if let placemark = placemarks?[0] {
                    
                    let location = placemark.location
                    let coordinate = location?.coordinate

                    let storeLocationPin = MapPin(myCoordinate: coordinate!)
                    storeLocationPin.title = placemark.name
                    storeLocationPin.address = placemark.addressDictionary?.description
                    self.storeLocationMapView.addAnnotation(storeLocationPin)
                }
            })
        }
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapPin {
            var view: MKPinAnnotationView

            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            let detailButton = UIButton(type: .DetailDisclosure)
            detailButton.addTarget(self, action: "mapPinDetailedButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            view.rightCalloutAccessoryView = detailButton as UIView
            
            return view
        }
        
        return nil
    }
    
    func mapPinDetailedButtonClicked(sender:UIButton!) {
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("StoreLocationDetailTableView") {
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}



