//
//  ContentView.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/6/28.
//  Copyright © 2020 TZ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data: StatusData
    
    var body: some View {
        ZStack(alignment: .leading) {
            GradientView()
            
            VStack() {
                ZStack {
                    CircleProcessView(progress: data.powerPercent)
                                
                    Image(systemName: "car.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30, alignment: .center)
                    
                    if data.isCharging {
                        Text("⚡️")
                            .offset(y: -38)
                            .transition(AnyTransition.opacity.animation(Animation.easeInOut(duration: 1)))
                    }
                }
                .frame(height: 80)
                .padding()

                Text(String(format: "%.0f", data.powerPercent * 100) + "%").font(.headline)
            }
        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.data.powerPercent = 0.9
//                self.data.isCharging = true
//            }
//            
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(StatusData.demo)
            .previewLayout(.fixed(width: 169, height: 169))
    }
}
