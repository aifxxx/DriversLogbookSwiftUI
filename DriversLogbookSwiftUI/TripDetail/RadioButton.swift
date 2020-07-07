//
//  RadioButtonField.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 19.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

//Single Radio Button Field
struct RadioButtonField: View {
    //Checkboxen
    var id: String
    var label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked: Bool
    let callback: (String) -> ()
    
    init(
        id: String,
        label: String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 16,
        isMarked: Bool = false,
        callback: @escaping (String) -> ()
    ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }

    var body: some View {
        Button(action: {
            self.callback(self.id)
            }) {
                HStack (alignment: .center, spacing: 10) {
                    Image(self.isMarked ? "RadioButtonSelected" : "RadioButton")
                        .renderingMode(.original)
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.size, height: self.size)
                    
                    Text(label)
                        .font(.custom("PorscheNext-Regular", size: 16))
                    
                    Spacer()
                }
                .foregroundColor(self.color)
        }.foregroundColor(Color.white)
    }
}

//Group of RadioButtons
enum Category: String {
    case privateTrip = "Privatfahrt"
    case businessTrip = "Geschäftsfahrt"
    case commute = "Arbeitsweg"
}

struct RadioButtonGroup: View {

    @Binding var selectedID: String
    let callback: (String) -> ()

    var body: some View {
        VStack {
            radioPrivateMajority
            radioBusinessMajority
            radioCommuteMajority
        }
    }
    
    var radioPrivateMajority: some View {
        RadioButtonField (id: Category.privateTrip.rawValue,
                          label: Category.privateTrip.rawValue,
                          isMarked: selectedID == Category.privateTrip.rawValue,
                          callback: radioGroupCallback)
}
    
    var radioBusinessMajority: some View {
            RadioButtonField (id: Category.businessTrip.rawValue,
                              label: Category.businessTrip.rawValue,
                              isMarked: selectedID == Category.businessTrip.rawValue,
                              callback: radioGroupCallback)
                
    }
    
    var radioCommuteMajority: some View {
            RadioButtonField (id: Category.commute.rawValue,
                              label: Category.commute.rawValue,
                              isMarked: selectedID == Category.commute.rawValue,
                              callback: radioGroupCallback)
    }

    func radioGroupCallback(id: String) {
        selectedID = id
        callback(id)
    }
}

//struct MainView: View {
//    var body: some View {
//            RadioButtonGroup { selected in
//                
//                print("Selected item: \(selected)")
//            }
//    }
//}
//
//struct RadioButtonField_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
