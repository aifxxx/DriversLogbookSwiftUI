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
    @ObservedObject var dataViewModel: DataViewModel = DataViewModel()

    init() {
        dataViewModel.fetch()
    }
    var body: some View {
        NavigationView {
            VStack () {
                CustomSegmentedControl(selected: self.$selected)
                if self.selected == 0 {
                    TripList(trips: $dataViewModel.tripData)
                } else if self.selected == 1 {
                    TripList(trips: $dataViewModel.tripDataSortedAscending)
                } else {
                    TripList(trips: $dataViewModel.tripDataSortedStaus)
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
