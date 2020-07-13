//
//  RemoteControlButton.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct RemoteControlButton: View {
        
    @EnvironmentObject var userExperence: UserExperence
    @Binding var longPressSwitch: LongPressSwitch
    @State var rotateAnimation: Bool = false
    @State var circleViewShouldShow = false
    @State var remoteControlSuccess = false
    @State var showProgressAnimation = false
    
    var defaultImage: String
    var successImage: String
    
    var body: some View {
        ZStack {
            
            PrepareCircleView(showProgressAnimation: showProgressAnimation)
            
            RemoteControlCircleView(circleViewShouldShow: circleViewShouldShow,
                                    rotateAnimation: rotateAnimation)
            
            Image(remoteControlSuccess ? successImage : defaultImage)
                .resizable()
                .scaledToFit()
                .onLongPressGesture {
                    
                    // 长按出现 Circle View
                    if self.longPressSwitch.isLongPress == false {
                        self.longPressSwitch.isLongPress.toggle()
                        
                        withAnimation(Animation.easeOut(duration: 1)) {
                            // 出现准备动画
                            self.showProgressAnimation = true
                        }
                        
                        // 准备动画结束后，开始远控的动画
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            
                            self.showProgressAnimation = false
                            self.remoteControlSuccess = false
                            self.circleViewShouldShow = true
                            
                            // 出现 Circle View 的动画
                            withAnimation(Animation
                                            .easeOut(duration: 0.5)
                                            .repeatCount(10, autoreverses: false)) {
                                self.rotateAnimation = true
                            }
                            
                            // 5 秒后，动画结束
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                                self.remoteControlSuccess = true
                                self.circleViewShouldShow = false
                                self.rotateAnimation = false
                                self.longPressSwitch.isLongPress = false
                                
                                // 触发远控成功 banner 的动画
                                withAnimation(.spring()) {
                                    self.userExperence.remoteControlSuccess = true
                                }
                            }
                        }
                    }
                }
        }
        .padding(5)
    }
}

struct RemoteControlCircleView: View {
    
    var circleViewShouldShow: Bool
    var rotateAnimation: Bool
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.3)
            .stroke(style: StrokeStyle(lineWidth: 6,
                                       lineCap: .round,
                                       lineJoin: .round))
            .foregroundColor(circleViewShouldShow ? FordColor.primary_blue_outline.color : .clear)
            .rotationEffect(.degrees(rotateAnimation ? 360 : 0), anchor: .center)
            
    }
}

struct PrepareCircleView: View {
    var showProgressAnimation: Bool
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: showProgressAnimation ? 1 : 0)
            .stroke(style: StrokeStyle(lineWidth: 6,
                                       lineCap: .round,
                                       lineJoin: .round))
            .foregroundColor(FordColor.primary_blue_outline.color)
            .rotationEffect(Angle(degrees: -90))
    }
}

struct RemoteControlButton_Previews: PreviewProvider {
    static var previews: some View {
        RemoteControlButton(longPressSwitch: .constant(.default),
                            defaultImage: FordICONProvider.home.blueCooling,
                            successImage: FordICONProvider.home.blueCoolingSucceed)
    }
}
