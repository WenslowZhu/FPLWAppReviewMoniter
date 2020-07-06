//
//  HomeView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/6.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = FordColor.bg_100.hexColor
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: FordColor.text_100.hexColor]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                KFImage(URL(string: FordHomeImageURL.homeBackground.urlString))
                    .resizable()
            }
            .navigationBarTitle(Text("首页"),
                                displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
