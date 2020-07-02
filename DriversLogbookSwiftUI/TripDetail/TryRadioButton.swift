//
//  TryRadioButton.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 29.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct TryRadioButton: View {
    @State private var selected = 1
    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $selected, label: Text("Favorite Color")) {
                Text("Red").tag(1)
                Text("Green").tag(2)
                Text("Blue").tag(3)
                Text("Other").tag(4)
            }.pickerStyle(DefaultPickerStyle())
            

            
        }
        .padding(20)
        .border(Color.gray)
    }
}

struct TryRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        TryRadioButton()
    }
}
