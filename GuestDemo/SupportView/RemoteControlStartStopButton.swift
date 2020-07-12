//
//  RemoteControlStartStopButton.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct RemoteControlStartStopButton: View {
    
    @EnvironmentObject var userExperence: UserExperence
    @Binding var longPressSwitch: LongPressSwitch
    @State var rotateAnimation: Bool = false
    @State var circleViewShouldShow = false
    @State var remoteControlSuccess = false
    @State var showProgressAnimation = false
    
    var startImage: String
    var stopImage: String
    
    var body: some View {
        ZStack {
            
            PrepareCircleView(showProgressAnimation: showProgressAnimation)
            
            RemoteControlCircleView(circleViewShouldShow: circleViewShouldShow,
                                    rotateAnimation: rotateAnimation)
            
            Image(remoteControlSuccess ? stopImage : startImage)
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
                            self.circleViewShouldShow = true
                            
                            // 出现 Circle View 的动画
                            withAnimation(Animation
                                            .easeOut(duration: 0.5)
                                            .repeatCount(10, autoreverses: false)) {
                                self.rotateAnimation = true
                            }
                            
                            // 5 秒后，动画结束
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                self.remoteControlSuccess.toggle()
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
            
            Text(remoteControlSuccess ? TranslationProvider.home.focusStop : TranslationProvider.home.focusStart)
                .font(.headline)
                .foregroundColor(remoteControlSuccess ? .black : .white)
                .padding(EdgeInsets(top: -12, leading: 0, bottom: 0, trailing: 0))
        }
        .padding(5)
    }
}

struct RemoteControlStartStopButton_Previews: PreviewProvider {
    static var previews: some View {
        RemoteControlStartStopButton(longPressSwitch: .constant(.default),
                                     startImage: FordICONProvider.home.focusStart,
                                     stopImage: FordICONProvider.home.focusStop)
            .previewLayout(.fixed(width: 90, height: 90))
    }
}
