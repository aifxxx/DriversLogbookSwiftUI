//
//  Trip.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Trip: Hashable, Codable, Identifiable {

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
    
    
    
    
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
    
    
}

//struct List {
//    var tripList: [Trip]
//
//
//}
//let sortedTrips: () = tripData.sort {
//    $0.date < $1.date
//}

// Trip
//struct User {
//    var firstName: String
//}
// tripData
//var users = [
//    User(firstName: "Jemima"),
//    User(firstName: "Peter"),
//    User(firstName: "David"),
//    User(firstName: "Kelly"),
//    User(firstName: "Isabella")
//]
//
//users.sort {
//    $0.firstName < $1.firstName
//}
//If you want to return a sorted array rather than sort it in place, use sorted() like this:
//
//let sortedUsers = users.sorted {
//    $0.firstName < $1.firstName
//}
