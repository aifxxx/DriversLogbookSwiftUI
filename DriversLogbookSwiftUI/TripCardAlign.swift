//
//  TripCardAlign.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 25.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct TripCardAlign: View {
    var trip: Trip

    var body: some View {
        ZStack (alignment: .center) {
            
            
        
//Background
        RoundedRectangle(cornerRadius: 4)
        .frame(width: 335, height: 187)
        .foregroundColor(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 0)
            
            HStack(alignment: .center){
            
            VStack{
                Image(trip.category)
                Image("route")
                Image("distance")
            }.frame(width: 20, height: 135, alignment: .center)
            
            VStack(alignment: .leading){
                Text(trip.category)
                .font(.custom("PorscheNext-SemiBold", size: 18))
                Text(trip.startAddress)
                .font(.custom("PorscheNext-Regular", size: 16))
                Text(trip.endAddress)
                .font(.custom("PorscheNext-Regular", size: 16))
                Text("\(trip.distance) km")
                .font(.custom("PorscheNext-SemiBold", size: 16))
            }
            }.frame(width: 315, alignment: .center)
            
//            VStack (alignment: .leading){
//
////Category and active status
//                HStack (alignment: .center){
////Category Icon
//
//
//
//                    Spacer()
//
////red=1-3days, yellow=4-7, clear=else
//                    if trip.activeDays >= 3 {
//                        Image("active")
//
//                    } else if trip.activeDays >= 0 {
//                    Image("active3")
//
//                    } else {
//                    Image("active0")
//                    }
//
//                    Text("Noch \(trip.activeDays) Tage bearbeitbar")
//                    .font(.custom("PorscheNext-Thin", size: 12))
//                    .foregroundColor(Color.init("FontLight"))
//                    .padding(.leading, 2)
//
//                }.frame(width: 305, alignment: .center)
//
//
////Adresses
//                HStack () {
//
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 12, height: 52)
//                            .padding(.leading, -8)
//
//
//
//
//                    VStack (alignment: .leading){
//
//
//                    }.padding(.leading, 8)
//                }.frame(width: 305, alignment: .center)
//
//                HStack {
//
//
//                }.padding(.leading, 5)
//
//                //                            .font(.custom("PorscheNext-SemiBold", size: 18))
//            }.frame(width: 335, height: 187)
//
        }
    }
}

struct TripcardAlign_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TripCardAlign(trip: tripData[0])
            TripCardAlign(trip: tripData[1])
            TripCardAlign(trip: tripData[2])
        }
        .previewLayout(.fixed(width: 335, height: 187))
    }
}

