//
//  RemoteControlSuccessBannerView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct RemoteControlSuccessBannerView: View {
    var body: some View {
        ZStack {
            FordColor.text_100.color
            
            VStack {
                FordColor.success_green.color
                    .frame(height: 5)
                
                Text(TranslationProvider.home.remoteControlSuccess)
                    .foregroundColor(FordColor.background.color)
                    .padding(.bottom, 10)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 25)
        .transition(.moveAndFade)
        .padding(.top, 10)
    }
}

struct RemoteControlSuccessBannerView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteControlSuccessBannerView()
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .top).combined(with: opacity)
        let removal = AnyTransition.move(edge: .top).combined(with: opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
