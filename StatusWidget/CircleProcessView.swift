//
//  CircleProcessView.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/7/2.
//  Copyright © 2020 TZ. All rights reserved.
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
                .foregroundColor(ColorUtility.gray01.color)
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: strokeLineWidth,
                                   lineCap: .round,
                                   lineJoin: .round))
                .foregroundColor(ColorUtility.green01.color)
                .rotationEffect(Angle(degrees: -90))
                .animation(Animation.easeInOut(duration: 1))
        }
    }
}

struct CircleProcessView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProcessView(progress: 0.6)
            .previewLayout(.fixed(width: 360, height: 169))
    }
}
