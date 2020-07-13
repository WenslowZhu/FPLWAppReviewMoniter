//
//  CircleProcessView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/13.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI
let strokeLineWidth: CGFloat = 7

struct CircleProcessView: View {
    let strokeLineWidth: CGFloat = 7
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: strokeLineWidth)
                .foregroundColor(FordColor.disable_gray_50.color)
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: strokeLineWidth,
                                   lineCap: .round,
                                   lineJoin: .round))
                .foregroundColor(FordColor.success_green.color)
                .rotationEffect(Angle(degrees: -90))
        }
    }
}

struct CircleProcessView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProcessView(progress: 0.3)
            .previewLayout(.fixed(width: 360, height: 169))
    }
}

