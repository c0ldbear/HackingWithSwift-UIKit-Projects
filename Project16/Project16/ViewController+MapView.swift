//
//  ViewController+MapView.swift
//  Project16
//
//  Created by Teddy Juhlin-Henricson on 2022-09-27.
//

import Foundation
import MapKit

extension ViewController {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is Capital else { return nil }
        
        // 2
        let identifier = "Capital"
        
        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            // 4
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier) // Same as MKPinAnnotationView (renamed in iOS 16)
            annotationView?.canShowCallout = true
            
            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
}
