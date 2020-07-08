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
    @EnvironmentObject var dataViewModel: DataViewModel

    var body: some View {
        NavigationView {
            VStack () {
                CustomSegmentedControl(selected: self.$selected)
                if self.selected == 0 {
                    TripList(trips: $dataViewModel.tripData, sorting: .descending)
                } else if self.selected == 1 {
                    TripList(trips: $dataViewModel.tripData, sorting: .ascending)
                } else {
                    TripList(trips: $dataViewModel.tripData, sorting: .status)
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
