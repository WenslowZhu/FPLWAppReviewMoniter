//
//  VehicleViewCell.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/13.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct VehicleViewCell: View {
    var title: String
    var value: CGFloat
    
    var body: some View {
        ZStack {
            FordColor.background_card.color
                .shadow(radius: 10)
            
            HStack() {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(FordColor.text_100.color)
                
                Spacer()
                
                ZStack {
                    CircleProcessView(progress: value)
                    
                    Text("\(Int(value * 100)) %")
                        .font(.title2)
                }
                .frame(width: 80, height: 80)
            }
            .padding()
        }
        .padding([.leading, .trailing], 25)

    }
}

struct VehicleViewCell_Previews: PreviewProvider {
    static var previews: some View {
        VehicleViewCell(title: "电量", value: 0.5)
            .previewLayout(.fixed(width: 300, height: 100))
            .preferredColorScheme(.light)
    }
}
