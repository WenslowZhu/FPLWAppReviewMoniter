//
//  VehicleView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/13.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct VehicleView: View {
    var body: some View {
        ZStack {
            FordColor.background.color
            
            ScrollView(.vertical) {
                VStack(spacing: 25) {
                    MapView()
                        .frame(height: 200)
                    
                    VehiœcleViewCell(title: "🔋", value: 0.4)
                        .frame(height: 100)
                    
                    VehicleViewCell(title: "🚗", value: 0.6)
                        .frame(height: 100)
                    
                    VehicleViewCell(title: "⛽️", value: 0.4)
                        .frame(height: 100)
                    
                    VehicleViewCell(title: "💰", value: 0.4)
                        .frame(height: 100)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
