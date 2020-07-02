//
//  ActiveTripMarker.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 02.07.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct ActiveTripMarker: View {
    var body: some View {
//         RoundedRectangle(cornerRadius: 4)
//                   .frame(width: 8, height: 187)
//                   .foregroundColor(Color.init("PorscheRot"))
//                       .padding(.top, -14)
//                       .padding(.leading, 0)
//
    
        RoundedRectangle(cornerRadius: 0, style: .circular)
        .fill(Color.init("PorscheRot"))
        .frame(width: 8, height: 187, alignment: .center)
        
        .cornerRadius(50, corners: [.topLeft, .bottomLeft])
        .foregroundColor(Color.init("PorscheRot"))
        //.background(Color.init(.blue))
        
        
    
    
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
        ActiveTripMarker()
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
