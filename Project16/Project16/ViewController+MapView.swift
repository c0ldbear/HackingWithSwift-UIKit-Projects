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
        // 1: If the annotation isn't from a capital city, it must return nil so iOS uses a default view.
        guard annotation is Capital else { return nil }
        
        // 2: Define a reuse identifier. This is a string that will be used to ensure we reuse annotation views as much as possible.
        let identifier = "Capital"
        
        // 3: Try to dequeue an annotation view from the map view's pool of unused views.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            // 4: If it isn't able to find a reusable view, create a new one using MKPinAnnotationView and sets its canShowCallout property to true. This triggers the popup with the city name.
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier) // Same as MKPinAnnotationView (renamed in iOS 16)
            annotationView?.canShowCallout = true
            
            // 5: Create a new UIButton using the built-in .detailDisclosure type. This is a small blue "i" symbol with a circle around it.
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6: If it can reuse a view, update that view to use a different annotation.
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
}
