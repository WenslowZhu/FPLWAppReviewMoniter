//
//  HomeView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/6.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userExperence: UserExperence

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                FordColor.background.color
                
                VStack() {
                    
                    if userExperence.remoteControlSuccess {
                        RemoteControlSuccessBannerView()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    withAnimation(.spring()) {
                                        userExperence.remoteControlSuccess = false
                                    }
                                }
                            }
                    } else {
                        RemoteControlSuccessBannerView()
                            .hidden()
                    }

                    Spacer()
                    
                    switch userExperence.userExperenceType {
                    case .blue:
                        BlueVehicleView()
                    case .focus:
                        FocusVehicleView()
                    default:
                        Text("Home")
                    }
                    
                    Spacer()
                }
            }
            .navigationBarTitle(Text(TranslationProvider.home.title),
                                displayMode: .inline)
        }
        .onAppear {
            UINavigationBar.appearance().barTintColor = FordColor.background.hexColor
            
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: FordColor.text_100.hexColor]
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            HomeView()
                .environmentObject(UserExperence.blueDemo)
                .preferredColorScheme(.dark)
        }
    }
}

struct LongPressSwitch {
    
    var isLongPress = false
    
    static let `default` = Self(isLongPress: false)
    
    init(isLongPress: Bool) {
        self.isLongPress = isLongPress
    }
}
