//
//  Data.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation



var tripData: [Trip] = load("TripData.json")
let userData: [User] = load("User.json")


//Sortierung alte zuerst
let sortedDescending = tripData.sorted{
    $0.date > $1.date
}

let sortedAscending = tripData.sorted {
    $0.date < $1.date
}

let sortedStatus = tripData.sorted {
    $0.activeDays < $1.activeDays
}

//sum of all distances
let sumDistance = tripData.map{ $0.distance }.reduce(0, +)

var trip: Trip?


//TRY Does not work

var privKM: Int?
var busKM: Int?
var comKM: Int?

//EDIT: nun wird nur auf die Gesamttrips (Dict) zugegriffen. Man muss jedoch auf die Keys innerhalb des Dicts greifen

var privCount: Int {
    for trip in tripData {
        if trip.category == "Privatfahrt" {
            privKM! += trip.distance
            
        } else if trip.category == "Geschäftsfahrt" {
            busKM! += trip.distance
        } else {
            comKM! += trip.distance
        }
        
    }
    
    return 1
    
}








//func countPrivKM() {
//    for trip in tripData {
//        if trip.category == "Privatfahrt" {
//            privCount += trip.distance
//
//        }
//    }
//}






func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//let dictionary = Dictionary(grouping: tripData, by: { (element: Trip) in
//    return element.category
//})



//sortiert die Trip Liste
extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        return Dictionary.init(grouping: self, by: key)
    }
}

//grouped ist ein Array mit sortierten Kategorien:
// [
//  "Privatfahrt": [
//      Trip(...)
//  ],
let grouped = tripData.group(by: {$0.category})

//returns 3 (3 Kategorien)
let count = grouped.count

//wie zählt man, wieviele Elemente in jeder Kategorie sind?
//wir haben ein Array mit drei Arrays: count nested array elements




