//
//  TripDetail.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI
import MapKit

struct TripDetail: View {
    
    
    
    
    //Button
    @State var isActive: Bool = false
    
    //Tabbar Try
    var tabbaritem = TabBar()
    
var trip: Trip

var body: some View {
    NavigationView {
        ScrollView {
    VStack (alignment: .leading) {
        HStack {
            Text(trip.date)
                .font(.custom("PorscheNext-SemiBold", size: 20))
            Image("active")
            .padding(.leading, 52)
            Text("Noch \(trip.activeDays) Tage bearbeitbar")
            .font(.custom("PorscheNext-Thin", size: 12))
            .foregroundColor(Color.init("FontLight"))
        }.padding(.top, -20)
        
        ZStack {
        BackgroundPrivate()
            VStack (alignment: .leading) {
            Text("Start")
                .bold()
            Text(trip.startAddress)
            //milage start
            Text("Ziel")
                .bold()
                .padding(.top, 20)
            Text(trip.endAddress)
            //milage end
                HStack {
                    Image("distance")
                    Text("\(trip.distance) km")
                }
                Image("Line")
                    //.padding(.top, 10)
                    //.padding(.bottom, 10)
            
            Text("Fahrtkategorie")
                .bold()
                
                //Tick Boxen
                RadioButtonGroup { selected in
                    print("Selected item: \(selected)")
                }.padding(.bottom, -10)
                
                
                
                
                
            }.font(.custom("PorscheNext-Regular", size: 16))
            .frame(width: 275, height: 380)
                .padding(.top, -25)
            
            
            
        }.padding(.top, -10)
        //Button
        NavigationLink(destination: TripList(), isActive: self.$isActive) {
            Button("Fahrt speichern") {
                
                self.isActive = true
                
            }.frame(width: 295, height: 48)
            .foregroundColor(.white)
                .background(Color.init("PorscheRot"))
                .font(.custom("PorscheNext-Regular", size: 16))
                .padding(.top, 10)
                .padding(.bottom, 30)
        }
    }.padding()
}
    }.padding(-40)
    
}
}

struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        TripDetail(trip: tripData[0])
    }
}
