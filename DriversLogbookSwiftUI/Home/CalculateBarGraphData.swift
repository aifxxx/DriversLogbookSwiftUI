//
//  CalculateBarGraphData.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 03.07.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import Foundation
import SwiftUI

class BarGraphData {
    var tripQuantity: Int?
    init(_ tripQuantity: Int){
        self.tripQuantity = tripQuantity
    }
    
    var totalTrips: Int {
        tripQuantity = [tripData].count
        return tripQuantity!
    }
    
    
    
    func calculateTripData(){
        //count all trips
        tripQuantity = [tripData].count
        
        
        
    }
    
    
    //TRY
    var trip: Trip?
    let privArr = [Trip].self
    var privCount: Int = 0
    
    func countPrivKM() {
        for trip in tripData {
            if trip.category == "Privatfahrt" {
                privCount += trip.distance
                
            }
        }
    }
    
    
}


var privArr: [Trip]?
    var pprivArr = tripData.filter({
        if $0.category == "Privatfahrt" {
            privArr?.append($0)
        }
        return (privArr != nil)
        })

var singleTrip = [privArr]




    
//print(privArr)
