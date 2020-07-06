//
//  ContentView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/4.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().barTintColor = FordColor.bg_100.hexColor
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    if selection == 0 {
                        Image("tabBar/home_active")
                    } else {
                        Image("tabBar/home_inactive")
                    }
                    Text("Home")
                }
                .tag(0)
            
            HomeView()
                .tabItem {
                    Image("tabBar/home_active")
                    Text("Home")
                }
                .tag(1)
        }
        .accentColor(FordColor.text_100.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
