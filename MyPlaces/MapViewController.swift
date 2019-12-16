//
//  MapViewController.swift
//  MyPlaces
//
//  Created by Иван Клименков on 16/12/2019.
//  Copyright © 2019 Ivan klimenkov. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var place: Place!

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlacemark()

    }
    
    
    @IBAction func closeVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func setupPlacemark() {
        
        let location = place.location
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = self.place.name
            annotation.subtitle = self.place.type
            
            guard let placemarkLocation = placemark?.location else { return }
            
            annotation.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
    
    }
    
}
