//
//  CustomSegmentedControl.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 23.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import SwiftUI

struct CustomSegmentedControl: View {
    
    //Selected segment at segmentedControl
    @Binding var selected: Int
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: 375, height: 38)
                .background(Color.white)
                .shadow(color: Color.gray.opacity(0.5), radius: 2.0, x: 0, y: 1)
                .padding(.bottom, 15)
                
                
                HStack {
                    
                //Segment 1
                Button(action: {
                    self.selected = 0
                }) {
                    VStack{
                        Text("Neuste zuerst")
                            .font(.custom("PorscheNext-Regular", size: 16))
                            .foregroundColor(.black)
                            .padding(.bottom, -18)
                            
                        
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
                        .padding(.bottom, -18)
                          
                        
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
                        .padding(.bottom, -18)
                        
                        Rectangle()
                            .frame(width: 100, height: 5)
                            .cornerRadius(4)
                            .foregroundColor(self.selected == 2 ? .red : .white)
                    }.padding(.trailing, 10)
                }

                //Background Rectangle
                }   .background(Color.white)
                    .animation(.default)
                
            }
        }
            

    }



