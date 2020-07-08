//
//  Launch.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 07.07.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct Launch: View {
    var body: some View {
        VStack{
        Image("Marque")
            .frame(width: 230, height: 108)
        Text("Digitales Fahrtenbuch")
            .font(.custom("PorscheNext-Regular", size: 20))
            .foregroundColor(Color.init("FontLight")).padding(.top)
        }
    }
}

struct Launch_Previews: PreviewProvider {
    static var previews: some View {
        Launch()
    }
}
