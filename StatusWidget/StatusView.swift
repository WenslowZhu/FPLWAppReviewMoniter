//
//  StatusView.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/7/2.
//  Copyright © 2020 TZ. All rights reserved.
//

import SwiftUI

struct StatusView: View {
    @EnvironmentObject var data: StatusData
    
    var body: some View {
        ZStack {
            GradientView()
            
            HStack {
                EVContentView()
                
                FuleContentView()
                
                OilContentView()
                
                MileageContentView()
            }
            .padding()
            .onAppear {
                self.data.powerPercent = 0.6
                self.data.fuelPercent = 0.4
                self.data.fuelDuration = 220
                self.data.oilPercent = 0.9
                self.data.mileagePercent = 0.3
                self.data.mileage = 4210
                self.data.isCharging = true
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
            .environmentObject(StatusData.demo)
            .previewLayout(.fixed(width: 360, height: 169))
    }
}

struct EVContentView: View {
    
    @EnvironmentObject var data: StatusData
    
    var body: some View {
        VStack() {
            ZStack {
                CircleProcessView(progress: data.powerPercent)
                            
                Text("🔋")
                    .font(.title)
                
            }
//            .frame(height: 80)
            .padding(5)

            Text(String(format: "%.0f", data.powerPercent * 100) + "%").font(.headline)

        }
    }
}

struct FuleContentView: View {
    @EnvironmentObject var data: StatusData
    
    var body: some View {
        VStack() {
            ZStack {
                CircleProcessView(progress: data.fuelPercent)
                            
                Text("⛽️")
                    .font(.title)
                
            }
//            .frame(height: 80)
            .padding(5)

            Text("\(data.fuelDuration)").font(.headline)
        }
    }
}

struct OilContentView: View {
    @EnvironmentObject var data: StatusData
    
    var body: some View {
        VStack() {
            ZStack {
                CircleProcessView(progress: data.oilPercent)
                            
                Text("🛢")
                    .font(.title)
                
            }
//            .frame(height: 80)
            .padding(5)

            Text(String(format: "%.0f", data.oilPercent * 100) + "%").font(.headline)
        }
    }
}

struct MileageContentView: View {
    @EnvironmentObject var data: StatusData
    
    var body: some View {
        VStack() {
            ZStack {
                CircleProcessView(progress: data.mileagePercent)
                            
                Text("🚗")
                    .font(.title)
                
            }
//            .frame(height: 80)
            .padding(5)

            Text("\(data.mileage)").font(.subheadline)
        }
    }
}
