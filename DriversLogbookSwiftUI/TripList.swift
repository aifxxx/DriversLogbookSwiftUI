//
//  TripList.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct TripListDescending: View {
    //Custom Styling
    init() {
        //remove divider from List
        UITableView.appearance().separatorColor = .clear
        
        //remove section gray background
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
            List {
                ForEach(sortedDescending) { trip in
                    Section(header: Text(trip.date)) {
                        ZStack (alignment: .center){
                        TripCard(trip: trip)
                        NavigationLink(destination: TripDetail(trip: trip)) {
                            TripCard(trip: trip)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                        
                        }.frame(width: 335, height: 187, alignment: .center)
                        
                    }.font(.custom("PorscheNext-SemiBold", size: 20))
                        .foregroundColor(.black)
                }
            }
            .listStyle(GroupedListStyle())
        
        }
    }

struct TripListAscending: View {
//Custom Styling
init() {
    //remove divider from List
    UITableView.appearance().separatorColor = .clear
    
    //remove section gray background
    UITableView.appearance().backgroundColor = .clear
}

var body: some View {
    
        List {
            ForEach(sortedAscending) { trip in
                Section(header: Text(trip.date)) {
                    ZStack (alignment: .center){
                    TripCard(trip: trip)
                    NavigationLink(destination: TripDetail(trip: trip)) {
                        TripCard(trip: trip)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 0)
                    .opacity(0)
                    
                    }.frame(width: 335, height: 187, alignment: .center)
                    
                }.font(.custom("PorscheNext-SemiBold", size: 20))
                    .foregroundColor(.black)
            }
        }
        .listStyle(GroupedListStyle())
    
    }
}

struct TripListStatus: View {

//Custom Styling
init() {
    //remove divider from List
    UITableView.appearance().separatorColor = .clear
    
    //remove section gray background
    UITableView.appearance().backgroundColor = .clear
}

var body: some View {
    
        List {
            ForEach(sortedStatus) { trip in
                Section(header: Text(trip.date)) {
                    ZStack (alignment: .center){
                    TripCard(trip: trip)
                    NavigationLink(destination: TripDetail(trip: trip)) {
                        TripCard(trip: trip)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 0)
                    .opacity(0)
                    
                    }.frame(width: 335, height: 187, alignment: .center)
                    
                }.font(.custom("PorscheNext-SemiBold", size: 20))
                    .foregroundColor(.black)
            }
        }
        .listStyle(GroupedListStyle())
    
    }
}


//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            TripList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//    }
//}
