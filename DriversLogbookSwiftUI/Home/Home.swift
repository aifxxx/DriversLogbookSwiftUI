//
//  Home.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var tripViewModel: DataViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading){
                    Text("Deine Übersicht")
                        .font(.custom("PorscheNext-SemiBold", size: 20))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20)
                        //.padding(.top, 30)
                        .padding(.bottom, 10)
                    BarGraph()

                    Text("Unvollständige Einträge")
                        .font(.custom("PorscheNext-SemiBold", size: 20))
                        .padding(.top, 10)
                        .padding(.leading, 15)
                        .padding(.trailing, 140)
                        .padding(.bottom, 0)

                    //Aktive Fahrten hier

                    VStack {
                        let activeTrips = tripViewModel.tripData.filter {$0.activeDays > 0 }
                        ForEach(activeTrips) { trip in
                                NavigationLink(destination: TripDetail(trip: self.$tripViewModel.tripData[self.tripViewModel.tripData.firstIndex(of: trip)!])) {
                                    TripCard(trip: trip)
                                }
                                .buttonStyle(PlainButtonStyle())
//                                .frame(width: 0)
//                                .opacity(0)
//                            }
                        }
                    }.font(.custom("PorscheNext-SemiBold", size: 20))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                    Spacer()
                    Text("Alle Fahrten findest du unter Fahrtenbuch")
                        .font(.custom("PorscheNext-Thin", size: 16))
                        .padding(.leading, 20)
                        .padding(.top, 20)

                }.navigationBarTitle(Text("Hallo!"), displayMode: .large)
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Home()
        }
    }
}
