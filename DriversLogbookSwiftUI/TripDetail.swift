//
//  TripDetail.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI
import MapKit

//shows details of a single trip selected from the list
struct TripDetail: View {
    //Tabbar Try
    var tabbaritem = TabBar()
    
    // Trip Instance for data
    @Binding var trip: Trip

    //Radio Button Selected

    //UI starts here
    var body: some View {
        
        //NavigationBar: NavigationBarBackButton, no title
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    //Spacer to separate NavBar and main elements
                    Spacer().padding(.top, 60)
                    
                    //Date and Aktive Days
                    TripDetailHeaderView(date: trip.date, activeDays: trip.activeDays)
                        .padding(.top, -20)
                    
                    //Card Design from Start to Category
                    ZStack {
                        //the Card
                        BackgroundPrivateMap()
                        
                        //Card elements
                        VStack (alignment: .leading) {
                            TripDetailsView(start: trip.startAddress, end: trip.endAddress, distance: trip.distance)
                            MapView(trip: trip).frame(height: 180)
                            
                            //Divider
                            Image("Line")

                            //Bottom part: Category
                            Text("Fahrtkategorie")
                                .bold()
                            
                            //Radio Buttons, active: tick
                            RadioButtonGroup(selectedID: $trip.category) { _ in
                            }.padding(.bottom, -10)
                            
                        }.font(.custom("PorscheNext-Regular", size: 16))
                            .frame(width: 275, height: 565)
                            .padding(.top, -25)
                    }.padding(.top, -10)
                    
                    //Save Button
                    NavigationLink(destination: TabBar(selectedTab: 1)) {
                        ZStack{
                            Rectangle()
                            .frame(width: 295, height: 48)
                                .background(Color.init("PorscheRot"))
                                .foregroundColor(Color.init("PorscheRot"))
                            Text("Fahrt speichern")
                                .foregroundColor(.white)
                            .font(.custom("PorscheNext-Regular", size: 16))
                        }
                        
                        .padding(.top, 5)
                        .padding(.bottom, 100)
                        
                    }
                }
                .padding()
                    .navigationBarTitle(" ", displayMode: .inline)
            }
        }.padding(-40)
    }
}

struct TripDetailHeaderView: View {
    var date: String
    var activeDays: Int

    var body: some View {
        HStack {
            Text(date)
                .font(.custom("PorscheNext-SemiBold", size: 20))
            if activeDays >= 3 {
                Image("active")
                    .padding(.leading, 52)

            } else if activeDays >= 0 {
                Image("active3")
                    .padding(.leading, 52)

            } else {
                Image("active0")
                    .padding(.leading, 52)

            }
            Text("Noch \(activeDays) Tage bearbeitbar")
                .font(.custom("PorscheNext-Thin", size: 12))
                .foregroundColor(Color.init("FontLight"))

        }
    }
}

struct TripDetailsView: View {
    var start: String
    var end: String
    var distance: Int

    var body: some View {
        //Top part: start and end and distance
        Text("Start")
            .bold()
        Text(start)
        // TODO: add start milage
        Text("Ziel")
            .bold()
            .padding(.top, 20)
        Text(end)
        // TODO: add end milage

        HStack {
            Image("distance")
            Text("\(distance) km")
        }

    }
}
struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        TripDetail(trip: .constant(tripData[0]))            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")

        TripDetail(trip: .constant(tripData[0]))            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("iPhone 11 Pro Max")

    }
}
