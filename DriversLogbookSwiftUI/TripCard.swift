//
//  TripCard.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct TripCard: View {
    var trip: Trip

    var body: some View {
        ZStack (alignment: .topLeading) {
        
        RoundedRectangle(cornerRadius: 4)
        .frame(width: 335, height: 187)
        .foregroundColor(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 0)
            
            VStack (alignment: .leading){
                HStack {
                    
                    //Image passend zur Kategorie
                    Image(trip.category)
                    Text(trip.category)
                    .font(.custom("PorscheNext-SemiBold", size: 18))
                    
                    if trip.activeDays >= 3 {
                        Image("active")
                        .padding(.leading, 20)
                    } else if trip.activeDays >= 0 {
                    Image("active3")
                        .padding(.leading, 20)
                    } else {
                    Image("active0")
                        .padding(.leading, 20)
                    }
                    Text("Noch \(trip.activeDays) Tage bearbeitbar")
                    .font(.custom("PorscheNext-Thin", size: 12))
                    .foregroundColor(Color.init("FontLight"))
                }
                
                HStack (){
                    Image("route")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 52)
                    VStack (alignment: .leading){
                        Text(trip.startAddress)
                        .font(.custom("PorscheNext-Regular", size: 16))
                        Text(trip.endAddress)
                        .font(.custom("PorscheNext-Regular", size: 16))
                        
                    }
                    
                }
                HStack {
                        Image("distance")
                        Text("\(trip.distance) km")
                        .font(.custom("PorscheNext-SemiBold", size: 16))
                }
                
                //                            .font(.custom("PorscheNext-SemiBold", size: 18))
            }.frame(width: 335, height: 187)

        }
    }
}

struct Tripcard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TripCard(trip: tripData[0])
            TripCard(trip: tripData[1])
        }
        .previewLayout(.fixed(width: 335, height: 187))
    }
}

