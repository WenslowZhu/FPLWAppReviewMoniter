//
//  RemoteControlButton.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct RemoteControlButton: View {
        
    @Binding var longPressSwitch: LongPressSwitch
    @State var rotateAnimation: Bool = false
    @State var circleViewShouldShow = false
    @State var remoteControlSuccess = false
    
    var defaultImage: String
    var successImage: String
    
    var body: some View {
        ZStack {
            CircleView()
                .foregroundColor(circleViewShouldShow ? FordColor.primary_blue_outline.color : .clear)
                .rotationEffect(.degrees(rotateAnimation ? 360 : 0), anchor: .center)
                
            Image(remoteControlSuccess ? successImage : defaultImage)
                .resizable()
                .scaledToFit()
                .onLongPressGesture {
                    // 长按出现 Circle View
                    if self.longPressSwitch.isLongPress == false {
                        self.longPressSwitch.isLongPress.toggle()
                        self.remoteControlSuccess = false
                        self.circleViewShouldShow = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.remoteControlSuccess = true
                            self.circleViewShouldShow = false
                            self.rotateAnimation = false
                            self.longPressSwitch.isLongPress = false
                        }
                        
                        // 长按出现 Circle View 的动画
                        withAnimation(Animation.easeOut(duration: 0.5).repeatCount(10, autoreverses: false)) {
                            self.rotateAnimation = true
                        }
                    }
                }
        }
        .padding(5)
    }
}

struct CircleView: View {
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.3)
            .stroke(style: StrokeStyle(lineWidth: 4,
                                       lineCap: .round,
                                       lineJoin: .round))
            
            
    }
}

struct RemoteControlButton_Previews: PreviewProvider {
    static var previews: some View {
        RemoteControlButton(longPressSwitch: .constant(.default),
                            defaultImage: FordICONProvider.home.blueCooling,
                            successImage: FordICONProvider.home.blueCoolingSucceed)
    }
}
