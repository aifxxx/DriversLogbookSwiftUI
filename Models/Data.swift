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


