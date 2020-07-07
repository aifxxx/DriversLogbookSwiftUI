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

    //Custom Styling
    init(trips: Binding<[Trip]>) {
        self._trips = trips
//        //remove divider from List
        UITableView.appearance().separatorColor = .clear
//
//        //remove section gray background
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        List {
            ForEach(trips.indices) { index in
                let trip = trips[index]
                Section(header: Text(trip.date)) {
                    ZStack (alignment: .center){
                        TripCard(trip: trip)
                        NavigationLink(destination: TripDetail(trip: $trips[index])) {
                            TripCard(trip: trip)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    .frame(width: 335, height: 187, alignment: .center)
                }.font(.custom("PorscheNext-SemiBold", size: 20))
                .foregroundColor(.black)
            }
        }
        .listStyle(GroupedListStyle())
    }
}
