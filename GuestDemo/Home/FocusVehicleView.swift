//
//  FocusVehicleView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct FocusVehicleView: View {
    @EnvironmentObject var userExperence: UserExperence
    @State var longPressSwitch = LongPressSwitch.default
    
    var body: some View {
        VStack {
            Image(FordICONProvider.home.focusVehicle)
                .padding()
            
            HStack {
                RemoteControlButton(longPressSwitch: $longPressSwitch,
                                    defaultImage: FordICONProvider.home.focusLock,
                                    successImage: FordICONProvider.home.focusLockeSucceed)
                    .frame(width: 90, height: 90, alignment: .center)
                
                RemoteControlStartStopButton(longPressSwitch: $longPressSwitch,
                                             startImage: FordICONProvider.home.focusStart,
                                             stopImage: FordICONProvider.home.focusStop)
                    .frame(width: 120, height: 120, alignment: .center)

                RemoteControlButton(longPressSwitch: $longPressSwitch,
                                    defaultImage: FordICONProvider.home.focusUnlock,
                                    successImage: FordICONProvider.home.focusUnlockSucceed)
                    .frame(width: 90, height: 90, alignment: .center)
            }
            .padding(.all, 20)
        }
    }
}

struct FocusVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        FocusVehicleView()
    }
}
