//
//  GradientView.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/7/2.
//  Copyright © 2020 TZ. All rights reserved.
//

import SwiftUI

struct GradientView: View {
    static let gradientStart = ColorUtility.blue03.color
    static let gradientEnd = ColorUtility.blue01.color
    
    var body: some View {
        Rectangle()// 渐变
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.2, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)))
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
