//
//  Home.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    //var user: User
    
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
                
                 
                
            Spacer()
            Text("Alle Fahrten findest du unter Fahrtenbuch")
                .font(.custom("PorscheNext-Thin", size: 16))
                .padding(.leading, 20)

            }.navigationBarTitle(Text("Hallo!").font(.subheadline), displayMode: .large)
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
