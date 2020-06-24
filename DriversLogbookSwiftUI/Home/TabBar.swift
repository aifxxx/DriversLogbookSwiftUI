//
//  TabBar.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image("Home")
                    Text("Übersicht")
                    
                    
            }.tag(0)
            TripListDescending()
                .tabItem {
                    Image("TripList")
                    Text("Deine Fahrten")
            }.tag(1)
            Profile()
                .tabItem {
                    Image("Profile")
                    Text("Profil")
            }.tag(2)
        }.accentColor(Color.init("PorscheRot"))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
