//
//  TripList.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct TripList: View {
    
    
    //Custom Styling
    init() {
        //remove divider from List
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        
        
        NavigationView {
            List(tripData) { trip in
                ZStack (alignment: .center){
                TripCard(trip: trip)
                NavigationLink(destination: TripDetail(trip: trip)) {
                    TripCard(trip: trip)
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 0)
                .opacity(0)
                
                }.frame(width: 335, height: 187, alignment: .center)
            }.navigationBarTitle(Text("Deine Fahrten"))
            
        }
            .frame(width: 355, height: 500, alignment: .center)
            
        }
    }


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            TripList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
