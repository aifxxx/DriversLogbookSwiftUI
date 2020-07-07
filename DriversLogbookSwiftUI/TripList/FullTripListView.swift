//
//  FullTripListView.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 24.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct FullTripListView: View {
    @State var selected = 0
    var body: some View {
        NavigationView {
            VStack () {
                CustomSegmentedControl(selected: self.$selected)
                
                if self.selected == 0 {
                    TripListDescending()
                } else if self.selected == 1 {
                    TripListAscending()
                } else {
                    TripListStatus()
                }
            }.background(Color("Color").edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Deine Fahrten")
        }
    }
}

struct FullTripListView_Previews: PreviewProvider {
    static var previews: some View {
        FullTripListView()
    }
}
