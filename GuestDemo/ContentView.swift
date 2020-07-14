//
//  ContentView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/4.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userExperence: UserExperence
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .environmentObject(userExperence)
                .tabItem {
                    if selection == 0 {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.homeActive,
                                        isActive: true)
                    } else {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.homeInactice,
                                        isActive: false)
                    }
                    Text(TranslationProvider.home.title)
                }
                .tag(0)
            
            VehicleView()
                .tabItem {
                    if selection == 1 {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.vehicleActive,
                                        isActive: true)
                    } else {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.vehicleInactive,
                                        isActive: true)
                    }
                    Text("车辆")
                }
                .tag(1)
            
            SignInWithAppleView()
                .tabItem {
                    if selection == 2 {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.mapActive,
                                        isActive: true)
                    } else {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.mapInactive,
                                        isActive: true)
                    }
                    Text("地图")
                }
                .tag(2)
            
            HomeView()
                .tabItem {
                    if selection == 3 {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.serviceActive,
                                        isActive: true)
                    } else {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.serviceInactive,
                                        isActive: true)
                    }
                    Text("服务")
                }
                .tag(3)
            
            HomeView()
                .tabItem {
                    if selection == 4 {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.mallActice,
                                        isActive: true)
                    } else {
                        TabBarImageView(imageName: FordICONProvider.tabBarICON.mallInactive,
                                        isActive: true)
                    }
                    Text("商城")
                }
                .tag(4)
        }
        .accentColor(FordColor.text_100.color)
        .onAppear {
            UITabBar.appearance().barTintColor = FordColor.background.hexColor
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserExperence.blueDemo)
            .preferredColorScheme(.dark)
    }
}
