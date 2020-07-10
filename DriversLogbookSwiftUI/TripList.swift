//
//  TripList.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI


//TripList Descending
struct TripList: View {
    @Binding var trips: [Trip]

    enum Sorting {
        case ascending
        case descending
        case status
    }

    var sorting: Sorting

    var sortedList: [Trip] {
        switch sorting {
        case .ascending:
            return trips.sorted { $0.date < $1.date}
        case .descending:
            return trips.sorted { $0.date > $1.date}
        case .status:
            return trips.sorted { $0.activeDays < $1.activeDays }
        }
    }
    //Custom Styling
    init(trips: Binding<[Trip]>, sorting: Sorting) {
        self._trips = trips
        self.sorting = sorting
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        List {
            ForEach(sortedList) { trip in
                Section(header: Text(trip.date)) {
                    ZStack (alignment: .center){
                        TripCard(trip: trip)
                        NavigationLink(destination: TripDetail(trip: self.$trips[self.trips.firstIndex(of: trip)!])) {
                            TripCard(trip: trip)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .opacity(0)
                    }
                }.font(.custom("PorscheNext-SemiBold", size: 20))
                .foregroundColor(.black)
            }
        }
        .listStyle(GroupedListStyle())
    }
}
