//
//  SegConPreview.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 23.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI


struct SegConPreview: View {
    
    @State var selected = 0
    
    
    var body: some View {
        
        VStack (spacing: 8) {
            CustomSegmentedControl(selected: self.$selected).padding(.top)
            
            if self.selected == 0 {
                TripList()
                
                
            } else if self.selected == 1 {
                TripList()
            } else {
                TripList()
            }
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
        
    }
}

struct SegConPreview_Previews: PreviewProvider {
    static var previews: some View {
        SegConPreview()
    }
}


