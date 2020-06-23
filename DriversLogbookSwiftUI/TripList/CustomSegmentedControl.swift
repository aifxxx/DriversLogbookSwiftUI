//
//  CustomSegmentedControl.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 23.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct CustomSegmentedControl: View {
    
    @Binding var selected: Int
    
    var body: some View {
        
    
            HStack {
                
            //Segment 1
            Button(action: {
                self.selected = 0
            }) {
                VStack{
                    Text("Neuste zuerst")
                        .font(.custom("PorscheNext-Regular", size: 16))
                        .foregroundColor(.black)
                        .padding(.bottom, -15)
                        
                    
                    Rectangle()
                        .frame(width: 100, height: 5)
                        .cornerRadius(4)
                        .foregroundColor(self.selected == 0 ? .red : .white)
                }.padding(.leading, 10)
            }
                
                
            Spacer()
                
            //Segment 2
            Button(action: {
                self.selected = 1
            }) {
                VStack{
                    Text("Älteste zuerst")
                        .font(.custom("PorscheNext-Regular", size: 16))
                        .foregroundColor(.black)
                    .padding(.bottom, -15)
                      
                    
                    Rectangle()
                        .frame(width: 100, height: 5)
                        .cornerRadius(4)
                        .foregroundColor(self.selected == 1 ? .red : .white)
                }
            }
                
                
            Spacer()
                
            //Segment 3
            Button(action: {
                self.selected = 2
            }) {
                VStack{
                    Text("Status")
                        .font(.custom("PorscheNext-Regular", size: 16))
                        .foregroundColor(.black)
                    .padding(.bottom, -15)
                    
                    Rectangle()
                        .frame(width: 100, height: 5)
                        .cornerRadius(4)
                        .foregroundColor(self.selected == 2 ? .red : .white)
                }.padding(.trailing, 10)
            }
                
                
            }   .background(Color.white)
                .animation(.default)
                
        

    }
}

