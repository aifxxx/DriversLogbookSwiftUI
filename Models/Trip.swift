//
//  Trip.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Trip: Hashable, Codable, Identifiable{

    var id: Int
    var date: String
    var category: String
    var activeDays: Int
    var startLocation: Coordinates
    var endLocation: Coordinates
    var startAddress: String
    var endAddress: String
    var distance: Int
    
    var startLocationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: startLocation.latitude, longitude: startLocation.longitude)
    }
    
    var endLocationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: endLocation.latitude, longitude: endLocation.longitude)
    }
    
    var latitudeArray: [Double] {
        [startLocation.latitude, endLocation.latitude]
    }
    
    var longitudeArray: [Double] {
        [startLocation.longitude, endLocation.longitude]
    }
    
    var points: [CLLocationCoordinate2D] {
        [startLocationCoordinates, endLocationCoordinates]
    }
    
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
}


