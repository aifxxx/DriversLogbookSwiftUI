//
//  Trip.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Trip: Hashable, Codable, Identifiable, Comparable {
    

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
    //bisher ungenutzt...
    static func < (lhs: Trip, rhs: Trip) -> Bool {
            return lhs.date < rhs.date
        }
        
        static func == (lhs: Trip, rhs: Trip) -> Bool {
            return lhs.date == rhs.date
        }
        
        
//        static func group (trips: [Trip], groupingOrder: GroupOrder) -> [Trip] {
//            let groups = Dictionary(grouping: trips) { (trip) -> Date in
//                return firstDayOfMonth(date: parseDate(trip.date))
//        }
//
//    }
    



}

//DateFormatter, set a date format for the used date in var trips []
func parseDate(_ str : String) -> Date {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "dd.MM.yyyy"
    return dateFormat.date(from: str)!
}

//selects the used dateComponents from calendar
func firstDayOfMonth(date: Date) -> Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month, .day], from: date)
    return calendar.date(from: components)!
}
