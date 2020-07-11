//
//  HomeView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/6.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var longPressSwitch = LongPressSwitch.default
    
    init() {
        UINavigationBar.appearance().barTintColor = FordColor.background.hexColor
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: FordColor.text_100.hexColor]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                FordColor.background.color
                VStack {
                    Image(FordICONProvider.home.vehicle)
                        .padding()
                    
                    HStack {
                        RemoteControlButton(longPressSwitch: $longPressSwitch,
                                            defaultImage: FordICONProvider.home.blueCooling,
                                            successImage: FordICONProvider.home.blueCoolingSucceed)
                            .frame(width: 80, height: 80, alignment: .center)
                        
                        RemoteControlButton(longPressSwitch: $longPressSwitch,
                                            defaultImage: FordICONProvider.home.blueLock,
                                            successImage: FordICONProvider.home.blueLockSucceed)
                            .frame(width: 90, height: 90, alignment: .center)
                        
                        RemoteControlButton(longPressSwitch: $longPressSwitch,
                                            defaultImage: FordICONProvider.home.blueUnlock,
                                            successImage: FordICONProvider.home.blueUnlockSucceed)
                            .frame(width: 90, height: 90, alignment: .center)

                        RemoteControlButton(longPressSwitch: $longPressSwitch,
                                            defaultImage: FordICONProvider.home.blueHeating,
                                            successImage: FordICONProvider.home.blueHeatingSucceed)
                            .frame(width: 80, height: 80, alignment: .center)
                    }
                }
            }
            .navigationBarTitle(Text(TranslationProvider.home.title),
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

struct LongPressSwitch {
    
    var isLongPress = false
    
    static let `default` = Self(isLongPress: false)
    
    init(isLongPress: Bool) {
        self.isLongPress = isLongPress
    }
}
