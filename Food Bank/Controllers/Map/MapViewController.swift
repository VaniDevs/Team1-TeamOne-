//
//  MapViewController.swift
//  Food Bank
//
//  Created by Vinson Li on 2016-03-05.
//  Copyright © 2016 Team1. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import ObjectMapper

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var storeLocationMapView: MKMapView!

    let addressBook = [
        "Buy Low, 370 E Broadway, Vancouver",
        "Capers, 1675 Robson Street, Vancouver",
        "Capers, 2285 W 4th Avenue, Vancouver",
        "Choices, 2627 W 16th, Vancouver",
        "IGA, 2030 W Broadway, Vancouver",
        "IGA, 2286 W Broadway, Vancouver",
        "Price Smart, 2880 Bentall Street, Vancouver",
        "Safeway, 1641 Davie Street, Vancouver"
    ]
    
    var clickedMapPin: MapPin?
    
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
            
            APIClient.getGooglePlaceId(addressName: address, result: { (result) -> () in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if result != nil {
                        self.getGooglePlaceDetails(result!)
                    }
                })
            })
        }
    }
    
    private func getGooglePlaceDetails(placeId: String) {
        APIClient.getGooglePlaceDetails(placeId) { (result) -> () in

            if let dict = result!["result"] {
                do {
                    if let theJSONData: NSData = try NSJSONSerialization.dataWithJSONObject(dict!, options: .PrettyPrinted) {
                        let theJSONString = NSString(data: theJSONData, encoding: NSASCIIStringEncoding)
                        let storeLocationPin = Mapper<MapPin>().map(theJSONString!)
                        self.storeLocationMapView.addAnnotation(storeLocationPin!)
                    }
                } catch {
                    
                }
            }
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
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        clickedMapPin = view.annotation as? MapPin
    }
    
    func mapPinDetailedButtonClicked(sender:UIButton!) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("StoreLocationDetailTableView") as! StoreLocationDetailTableViewController

        vc.storeMapPin = clickedMapPin
        vc.userLocation = storeLocationMapView.userLocation.location
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



