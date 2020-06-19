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
    
    //Checkboxen
    @State var isChecked:Bool = false
    func toggle(){isChecked = !isChecked}
    
    //Button
    @State var isActive: Bool = false
    
var trip: Trip

var body: some View {
    NavigationView {
        
    VStack (alignment: .leading) {
        HStack {
            Text(trip.date)
                .font(.custom("PorscheSemiBold", size: 20))
            Image("active")
            .padding(.leading, 52)
            Text("Noch \(trip.activeDays) Tage bearbeitbar")
            .font(.custom("PorscheNext-Thin", size: 12))
            .foregroundColor(Color.init("FontLight"))
        }
        ZStack {
        BackgroundPrivate()
            VStack (alignment: .leading) {
            Text("Start")
                .bold()
            Text(trip.startAddress)
            //milage start
            Text("Ziel")
                .bold()
            Text(trip.endAddress)
            //milage end
                HStack {
                    Image("distance")
                    Text("\(trip.distance) km")
                }
                Image("Line")
            
            Text("Fahrtkategorie")
                .bold()
                
                //Tick Boxen
                VStack (alignment: .leading){
                    Button(action: toggle){
                        HStack{
                            Image(systemName: isChecked ? "checkmark.square": "square")
                            Text("Privatfahrt") }
                    }.foregroundColor(.black)
                    
                    Button(action: toggle){
                        HStack{
                            Image(systemName: isChecked ? "checkmark.square": "square")
                            Text("Geschäftsfahrt") }
                    }.foregroundColor(.black)
                    
                    Button(action: toggle){
                        HStack{
                            Image(systemName: isChecked ? "checkmark.square": "square")
                            Text("Arbeitsweg") }
                    }.foregroundColor(.black)
                }
                
                
                
                
                
            }.font(.custom("PorscheNext-Regular", size: 16))
            
            
        }
        //Button
        NavigationLink(destination: TripList(), isActive: self.$isActive) {
            Button("Fahrt speichern") {
                
                self.isActive = true
                
            }.frame(width: 295, height: 48)
            .foregroundColor(.white)
                .background(Color.init("PorscheRot"))
                .padding(.top, 10)
        }
    }
}
}
}

struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        TripDetail(trip: tripData[0])
    }
}
