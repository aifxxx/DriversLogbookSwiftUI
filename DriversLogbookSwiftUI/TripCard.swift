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
        
//Background
        RoundedRectangle(cornerRadius: 4)
        .frame(width: 335, height: 187)
        .foregroundColor(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 0)
            
            VStack (alignment: .leading){

//Category and active status
                HStack (alignment: .center){
//Category Icon
                    Image(trip.category)
                    Text(trip.category)
                    .font(.custom("PorscheNext-SemiBold", size: 18))
                    
                    Spacer()
                    
//red=1-3days, yellow=4-7, clear=else
                    if trip.activeDays >= 3 {
                        Image("active")
                        
                    } else if trip.activeDays > 0 {
                    Image("active3")
                        
                    } else {
                    Image("active0")
                    }
                    
                    if trip.activeDays > 0 {
                        Text("Noch \(trip.activeDays) Tage bearbeitbar")
                        .font(.custom("PorscheNext-Thin", size: 12))
                        .foregroundColor(Color.init("FontLight"))
                        .padding(.leading, 2)
                    }
                    
                    
                }.frame(width: 305, alignment: .center)
                    .padding(.leading, 3)
                
                
//Adresses
                HStack () {
                        Image("route")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 52)
                            //.padding(.leading, -15)
                    
                    VStack (alignment: .leading){
                        Text(trip.startAddress)
                        .font(.custom("PorscheNext-Regular", size: 16))
                        Text(trip.endAddress)
                        .font(.custom("PorscheNext-Regular", size: 16))
                    
                    }
                }.frame(width: 305, alignment: .leading)
                    .padding(.leading, 10)
                
                HStack {
                        Image("distance")
                        Text("\(trip.distance) km")
                        .font(.custom("PorscheNext-SemiBold", size: 16))
                }.padding(.leading, 5)
                
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
            TripCard(trip: tripData[2])
            TripCard(trip: tripData[3])
        }
        .previewLayout(.fixed(width: 335, height: 187))
    }
}

