//
//  SignInWithAppleView.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/14.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct SignInWithAppleView: View {
    var body: some View {
        ZStack {
            FordColor.background.color
            
            VStack {
                Text("立即添加车辆")
                    .font(.headline)
                    .padding(.all, 10)
                
                Text("爱车状态 尽在掌握")
                    .font(.title)
                
                Image(FordICONProvider.signIn.vehicleLanding)
                
                Text("只需在”我的车辆“中添加车辆识别码（VIN），即可随时随地定位爱车，掌握实时车况数据，畅享车载热点与在线预约保养功能。")
                    .font(.subheadline)
                    .padding(.all, 10)
                
                SignInWithAppleButton()
                    .frame(width: 230, height: 50)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct SignInWithAppleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInWithAppleView()
                .preferredColorScheme(.dark)
        }
    }
}

