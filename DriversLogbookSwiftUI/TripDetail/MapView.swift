//
//  MapView.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 25.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    //Trip Instance for data
    var trip: Trip
    

    
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
        
    }
    
    
    
    
    
    
    func zoomToFitMapAnnotations(mapView:MKMapView)
    {
        if(mapView.annotations.count == 0)
        {
              return
        }


        var topLeftCoord = CLLocationCoordinate2D.init(latitude: -90, longitude: 180)


        var bottomRightCoord = CLLocationCoordinate2D.init(latitude: 90, longitude: -180)


        for i in 0..<mapView.annotations.count
        {
            let annotation = mapView.annotations[i]

            topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
            topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);

            bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
            bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
        }


        let resd = CLLocationCoordinate2D.init(latitude: topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5, longitude: topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5)

        let span = MKCoordinateSpan.init(latitudeDelta: fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.3, longitudeDelta: fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.3)

        var region = MKCoordinateRegion.init(center: resd, span: span);



        region = mapView.regionThatFits(region)

        mapView.setRegion(region, animated: true)


    }
    
    
    
    
    
    
    
    
    
    func makeUIView(context:
        UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        
        
        
        
        
        let startAnnotation = MKPointAnnotation()
        startAnnotation.title = "Start"
        startAnnotation.subtitle = trip.startAddress
        startAnnotation.coordinate = CLLocationCoordinate2D(latitude: trip.startLocation.latitude, longitude: trip.startLocation.longitude)
        mapView.addAnnotation(startAnnotation)
        
        let endAnnotation = MKPointAnnotation()
        endAnnotation.title = "Ziel"
        endAnnotation.subtitle = trip.endAddress
        endAnnotation.coordinate = CLLocationCoordinate2D(latitude: trip.endLocation.latitude, longitude: trip.endLocation.longitude)
        mapView.addAnnotation(endAnnotation)
        
        return mapView
    }
    
    
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let startAnnotation = trip.startLocationCoordinates
        
        zoomToFitMapAnnotations(mapView: uiView)
          
            
        
        
//        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//
//        let region = MKCoordinateRegion(center: startAnnotation, span: span)
//
//        uiView.setRegion(region, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        
        mapView.centerToStartAnnotation(trip.startLocationCoordinates)
        
        
        mapView.showAnnotations(mapView.annotations, animated: true)
 
    }
    
    
    
//    func getSpanForCoordinates() {
//        let minX: Double
//        let maxX: Double
//        let minY: Double
//        let maxY: Double
//
//        minX = trip.latitudeArray.min()!
//        maxX = trip.latitudeArray.max()!
//        minY = trip.longitudeArray.min()!
//        maxY = trip.longitudeArray.max()!
//
//        let deltaX = maxX - minX
//        let deltaY = maxY - minX
//
//        var latitudeDelta: Double
//        var longitudeDelta: Double
//    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(trip: tripData[0])
    }
}

private extension MKMapView {
  func centerToStartAnnotation(
    _ startLocation: CLLocationCoordinate2D,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: startLocation.latitude, longitude: startLocation.longitude),
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}


