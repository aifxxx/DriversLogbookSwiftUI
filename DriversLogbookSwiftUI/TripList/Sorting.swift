//
//  Sorting.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 23.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import Foundation
import UIKit

enum GroupOrder {
    case ascending
    case descending
}


    
    struct DaySection : Comparable {
    var day: Date
    var trips: [Trip]
        
        static func < (lhs: DaySection, rhs: DaySection) -> Bool {
            return lhs.day < rhs.day
        }
        
        static func == (lhs: DaySection, rhs: DaySection) -> Bool {
            return lhs.day == rhs.day
        }
        
        static func group (trips: [Trip], groupingOrder: GroupOrder) -> [DaySection] {
            let groups = Dictionary(grouping: trips) { (trip) -> Date in
                return firstDayOfMonth(date: parseDate(trip.date))
                
                 
            }
            //sorted() = ascending
            //sorted(by:{$0.day > $1.day}) with condition = descending
            switch groupingOrder {
            case .descending:
                return groups.map(DaySection.init(day:trips:)).sorted(by:{$0.day < $1.day})
            case .ascending:
                return groups.map(DaySection.init(day:trips:)).sorted(by:{$0.day > $1.day})
                
            }
            
            }
}

//    //DateFormatter, set a date format for the used date in var trips []
//    func parseDate(_ str : String) -> Date {
//        let dateFormat = DateFormatter()
//        dateFormat.dateFormat = "dd.MM.yyyy"
//        return dateFormat.date(from: str)!
//    }
//
//    //selects the used dateComponents from calendar
//    func firstDayOfMonth(date: Date) -> Date {
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.year, .month, .day], from: date)
//        return calendar.date(from: components)!
//    }
//    
    
    

