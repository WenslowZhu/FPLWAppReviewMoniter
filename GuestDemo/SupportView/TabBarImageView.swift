//
//  TabBarImageView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/11.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct TabBarImageView: View {
    var imageName: String
    var isActive: Bool
    
    var body: some View {
        Image(imageName)
            .renderingMode(isActive ? .template : .original)
            .foregroundColor(FordColor.text_100.color)
    }
}

struct TabBarImageView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarImageView(imageName: "tabBar/home_active", isActive: true)
    }
}
