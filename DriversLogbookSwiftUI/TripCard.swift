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
                .foregroundColor(Color.white)
                .shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 0)

            HStack(alignment: .top) {
                ActiveTripMarker(color: trip.activeDays > 0 ? Color.init("PorscheRot") : Color.white)
                    .frame(width: 10, alignment: .leading)
                VStack (alignment: .leading){
                    //Category and active status
                    TripCategoryView(category: trip.category, activeDays: trip.activeDays)
                    TripAddressView(startAddress: trip.startAddress, endAddress: trip.endAddress)
                    TripDistanceView(distance: trip.distance)
                        .padding(.bottom, 12)
                } .padding(.top, 20)
            }
        }
    }
}

struct TripCategoryView: View {
    var category: String
    var activeDays: Int
    var body: some View {
        HStack (alignment: .center){
            //Category Icon
            Image(category)
            Text(category)
                .font(.custom("PorscheNext-SemiBold", size: 18))
            Spacer()

            //red=1-3days, yellow=4-7, clear=else
            if activeDays >= 3 {
                Image("active")

            } else if activeDays > 0 {
                Image("active3")

            } else {
                Image("active0")
            }

            if activeDays > 0 {
                Text("Noch \(activeDays) Tage bearbeitbar")
                    .font(.custom("PorscheNext-Thin", size: 12))
                    .foregroundColor(Color.init("FontLight"))
                    .padding(.leading, 2)
            }
        }
        .padding(.leading, 0)
        .padding(.trailing, 8)
    }
}

struct TripAddressView: View {
    var startAddress: String
    var endAddress: String
    var body: some View {
        //Adresses
        HStack () {
            Image("route")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 12, height: 52)
            //.padding(.leading, -15)

            VStack (alignment: .leading){
                Text(startAddress)
                    .font(.custom("PorscheNext-Regular", size: 16))
                Text(endAddress)
                    .font(.custom("PorscheNext-Regular", size: 16))

            }
        }
        .padding(.leading, 14)
    }
}

struct TripDistanceView: View {
    var distance: Int
    var body: some View {
        HStack {
            Image("distance")
            Text("\(distance) km")
                .font(.custom("PorscheNext-SemiBold", size: 16))
        }.padding(.leading, 8)
        .font(.custom("PorscheNext-SemiBold", size: 18))
    }
}

struct Tripcard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TripCard(trip: tripData[0])
            TripCard(trip: tripData[1])
            //            TripCard(trip: tripData[2])
            TripCard(trip: tripData[3])
        }
        .previewLayout(.fixed(width: 400, height: 400))
    }
}

