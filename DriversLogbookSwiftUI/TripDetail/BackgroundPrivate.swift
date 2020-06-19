//
//  BackgroundPrivate.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 19.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct BackgroundPrivate: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
        .frame(width: 295, height: 452)
        .foregroundColor(Color.white)
        .shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 0)
    }
}

struct BackgroundPrivate_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundPrivate()
    }
}
