//
//  BlueVehicleView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct BlueVehicleView: View {
    
    @EnvironmentObject var userExperence: UserExperence
    @State var longPressSwitch = LongPressSwitch.default
    
    var body: some View {
        VStack {
            Image(FordICONProvider.home.blueVehicle)
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
}

struct BlueVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        BlueVehicleView()
    }
}
