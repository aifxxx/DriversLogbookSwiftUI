//
//  BarGraph.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct BarGraph: View {
    
    //Nav Bar Title Styling
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "PorscheNext-Bold", size: 28)!]
    }
    
    var bar1 = Bar(percent: 145, category: "Privatfahrt")
    var bar2 = Bar(percent: 116, category: "Geschäftsfahrt")
    var bar3 = Bar(percent: 29, category: "Arbeitsweg")
    
    @State var trip: Trip?

    var totalTrips: Int {
        let trips = tripData
        let sum = trips.count
        return sum
    }

    var totalKilometers: Int {
        let sum = sumDistance
        return sum
    }
    
    var countPr: Int {
        let sumPrivKM = busKM
        return sumPrivKM!
    }

    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {

            //Overview with KM and Trips
            VStack (alignment: .leading, spacing: 0.0) {
                HStack(alignment: .center, spacing: 0) {

                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("\(totalKilometers) km")
                            .font(.custom("PorscheNext-SemiBold", size: 20))
                            .padding(0.0)
                        Text("Gesamt")
                            .font(.custom("PorscheNext-Thin", size: 16))
                    }.frame(maxWidth: .infinity)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(totalKilometers) km")
                            .font(.custom("PorscheNext-SemiBold", size: 20))
                        Text("2020")
                            .font(.custom("PorscheNext-Thin", size: 16))
                    }.frame(maxWidth: .infinity)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(totalTrips)")
                            .font(.custom("PorscheNext-SemiBold", size: 20))
                        Text("Fahrten 2020")
                            .font(.custom("PorscheNext-Thin", size: 16))
                    }.frame(maxWidth: .infinity)
                }
                Image("Line")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 20)
                    .padding(.trailing, 18)
                    .padding(.top, 10)
                    .padding(.bottom, -30)
            }
            .padding(.bottom, 35.0)
            .frame(width: 375)

            VStack (alignment: .leading) {
                //BarGraph
                //Bar1
                HStack {
                    Text("Privatfahrt")
                        .padding(.bottom, 0)
                        .padding(.leading, 60)
                        .font(.custom("PorscheNext-Regular", size: 16))
                        .foregroundColor(.init("FontLight"))
                    Spacer()
                    Text("50 %") //!!!
                        .padding(.trailing, 20)
                        .font(.custom("PorscheNext-Regular", size: 16))
                }.padding(.top, -15)
                HStack {
                    Image("Privatfahrt")
                        .padding(.leading, 20)
                    bar1.self
                        .padding(.leading, 10)
                }
                //Bar2
                HStack {
                    Text("Geschäftsfahrt")
                        .padding(.bottom, 0)
                        .padding(.leading, 60)
                        .font(.custom("PorscheNext-Regular", size: 16))
                        .foregroundColor(.init("FontLight"))
                    Spacer()
                    Text("40 %") //!!!
                        .padding(.trailing, 20)
                        .font(.custom("PorscheNext-Regular", size: 16))
                }
                HStack {
                    Image("Geschäftsfahrt")
                        .padding(.leading, 20)
                    bar2.self
                        .padding(.leading, 10)
                        .animation(.default)
                }
                //Bar3
                HStack {
                    Text("Arbeitsweg")
                        .padding(.bottom, 0)
                        .padding(.leading, 60)
                        .font(.custom("PorscheNext-Regular", size: 16))
                        .foregroundColor(.init("FontLight"))
                    Spacer()
                    Text("10 %") //!!!
                        .padding(.trailing, 20)
                        .font(.custom("PorscheNext-Regular", size: 16))
                }
                HStack {
                    Image("Arbeitsweg")
                        .padding(.leading, 20)
                    bar3.self
                        .padding(.leading, 10)
                }
            }
            VStack {
                Text("Kilometeranteile von 2020")
                    .font(.custom("PorscheNext-Thin", size: 12))
                    .padding(.leading, 200)
            }
        }

    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph()
    }
}

//the bars
struct Bar: View {
    var percent: Int = 0
    var category = ""
    
    @State var animate = false

    var body: some View {
        HStack {
            ZStack (alignment: .leading){
                Rectangle().fill(Color.init("BarLight"))
                    .frame(width: 290, height: 10)
                
                
                Rectangle().fill(Color.init("BarDark"))
                    .frame(width: self.animate ? CGFloat(percent) : 0, height: 10)
                    .animation(Animation.linear(duration: 1).delay(1))
                    .onAppear{


                        return withAnimation(){
                            self.animate = true
                        }
                    }
            }
        }
    }
}


//Sample Data
struct type : Identifiable {
    var id: Int
    var percent: Int
    var category: String
}

var percents = [
    type(id: 0, percent: 50, category: "Privatfahrt"),
    type(id: 1, percent: 40, category: "Geschäftsfahrt"),
    type(id: 2, percent: 10, category: "Arbeitsweg")
]
