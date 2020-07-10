//
//  ActiveTripMarker.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 02.07.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct ActiveTripMarker: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 0, style: .circular)
        .fill(color)

        .cornerRadius(50, corners: [.topLeft, .bottomLeft])
        .foregroundColor(color)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

        return Path(path.cgPath)
    }
}

struct ActiveTripMarker_Previews: PreviewProvider {
    static var previews: some View {
        ActiveTripMarker(color: Color.init("PorscheRot"))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
