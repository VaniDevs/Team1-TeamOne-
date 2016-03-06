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

    var locations = [MapPin]()
    
    let addressBook = [
        // Vancouver
        "Buy Low, 370 E Broadway, Vancouver",
        "Capers, 1675 Robson Street, Vancouver",
        "Capers, 2285 W 4th Avenue, Vancouver",
        "Choices, 2627 W 16th, Vancouver",
        "IGA, 2030 W Broadway, Vancouver",
        "IGA, 2286 W Broadway, Vancouver",
        "Price Smart, 2880 Bentall Street, Vancouver",
        "Safeway, 1641 Davie Street, Vancouver",
        "Safeway, 1766 Robson Street Safeway, Vancouver",
        "2315 W 4th Avenue, Vancouver",
        "Safeway, 2733 W Broadway, Vancouver",
        "Safeway, 4575 W 10th Avenue, Vancouver",
        "Save on Foods, 2308 Cambie Street Super Valu, Vancouver",
        "1645 E 1st Avenue, Vancouver",
        "Superstore, 3185 Grandview Hwy, Vancouver",
        "T & T Supermarket, 2800 E 1st Avenue, Vancouver",
        "Walmart, 3585 Grandview Hwy, Vancouver",
        "Whole foods, 510 West 8th Avenue, Vancouver",
        
        // Burnaby
        "Buy Low Foods, 7641 Royal Oak, Burnaby",
        " Extra Foods, 7170 Kerr Street, Burnaby",
        "IGA, 1601 Burnwood Drive, Burnaby",
        "IGA, 4469 Kingsway, Burnaby",
        "Price Smart Foods, 3433 North Road, Burnaby",
        "Price Smart Foods, 7501 Market Crossing, Burnaby",
        "Safeway, 3410 Kingsway, Burnaby",
        "Safeway, 5235 Kingsway, Burnaby",
        "Safeway, 9855 Austin Road, Burnaby",
        "Save On Foods, 6100 McKay Ave, Metrotown, Burnaby",
        "Save On Foods, 7155 Kingsway, Highgate Mall, Burnaby",
        "Superstore, 3185 Grandview Hwy., Burnaby",
        "Superstore, 4700 Kingsway, Metrotown, Burnaby",
        
        // North Shore
        "Extra Foods, 2002 Park Royal South, West Vancouver",
        "IGA, 150 W Esplanade, North Vancouver",
        "Safeway, 1175 Mt. Seymour Road, North Vancouver",
        "Safeway, 5385 Headland Drive, Caulfeild Mall, West Vancouver",
        "Save On Foods, 1250 Marine Drive, Pemberton Plaza, North Vancouver",
        "Save on Foods, 333 Brooksbank, Park and Tilford, North Vancouver",
        "Superstore, 333 Seymour Boulevard, North Vancouver"
    ]
    
    var clickedMapPin: MapPin?
    
    override func viewDidLoad() {
        loadStoreLocations()

        super.viewDidLoad()
        
        title = "Drop Off"
        navigationItem.title = "Drop Off Locations"
        
        let initLocation = CLLocationCoordinate2D(
            latitude: 49.25,
            longitude: -123.05
        )
        let span = MKCoordinateSpanMake(0.3, 0.3)
        storeLocationMapView.setRegion(MKCoordinateRegion(center: initLocation, span: span), animated: true)
    }
    
    private func loadStoreLocations() {
        storeLocationMapView.removeAnnotations(locations)
        for address in addressBook {
            APIClient.getGooglePlaceId(addressName: address, result: { (result) -> () in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if let result = result {
                        let storeLocationPin = Mapper<MapPin>().map(result)
                        if let storeLocationPin = storeLocationPin {
                            storeLocationPin.title = address
                            self.storeLocationMapView.addAnnotation(storeLocationPin)
                            self.locations.append(storeLocationPin)
                        }
                    }
                })
            })
        }
    }

    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapPin {
            
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            let detailButton = UIButton(type: .DetailDisclosure)
            detailButton.addTarget(self, action: "mapPinDetailedButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            view.rightCalloutAccessoryView = detailButton as UIView
            
            view.image = UIImage(named: "map_pin")
            
            return view
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        clickedMapPin = view.annotation as? MapPin
    }
    
    func mapPinDetailedButtonClicked(sender:UIButton!) {let vc = self.storyboard?.instantiateViewControllerWithIdentifier("StoreLocationDetailTableView") as! StoreLocationDetailTableViewController
        
        vc.storeMapPin = storeLocationMapView.selectedAnnotations.first as? MapPin
        vc.userLocation = self.storeLocationMapView.userLocation.location
        self.navigationController?.pushViewController(vc, animated: true)
        
        /*if let placeId = clickedMapPin?.placeId {
            APIClient.getGooglePlaceDetails(placeId) { (result) -> () in
                if let result = result {
                    if let dict = result["result"] as? [String: AnyObject] {
                        do {
                            if let theJSONData: NSData = try NSJSONSerialization.dataWithJSONObject(dict, options: .PrettyPrinted) {
                                let theJSONString = NSString(data: theJSONData, encoding: NSASCIIStringEncoding)
                                if let mapPin = Mapper<StoreDetail>().map(theJSONString) {
                                    
                                    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("StoreLocationDetailTableView") as! StoreLocationDetailTableViewController
                                    
                                    vc.storeMapPin = mapPin
                                    vc.userLocation = self.storeLocationMapView.userLocation.location
                                    self.navigationController?.pushViewController(vc, animated: true)
                                }
                            }
                        } catch {
                            
                        }
                    }
                }
            }
        }*/
        
    }
    
}



