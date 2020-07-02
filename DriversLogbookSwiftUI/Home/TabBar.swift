//
//  TabBar.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 18.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    @State var selectedTab = 0
    
    
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Home()
                .tabItem {
                    Image("Home")
                    Text("Übersicht")
                    
                    
            }.tag(0)
            FullTripListView()
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
