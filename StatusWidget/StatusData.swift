//
//  StatusData.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/6/28.
//  Copyright © 2020 TZ. All rights reserved.
//

import Foundation
import SwiftUI

class StatusData: ObservableObject {
    @Published var powerPercent: CGFloat
    @Published var fuelPercent: CGFloat
    @Published var fuelDuration: Int
    @Published var oilPercent: CGFloat
    @Published var mileagePercent: CGFloat
    @Published var mileage: Int
    @Published var isCharging: Bool
    
    init(powerPercent: CGFloat,
         fuelPercent: CGFloat,
         fuelDuration: Int,
         oilPercent: CGFloat,
         mileagePercent: CGFloat,
         mileage: Int,
         isCharging: Bool) {
        self.powerPercent = powerPercent
        self.fuelPercent = fuelPercent
        self.fuelDuration = fuelDuration
        self.oilPercent = oilPercent
        self.mileagePercent = mileagePercent
        self.mileage = mileage
        self.isCharging = isCharging
    }
    
    static var demo: StatusData {
        StatusData(powerPercent: 0.0,
                   fuelPercent: 0.0,
                   fuelDuration: 0,
                   oilPercent: 0.0,
                   mileagePercent: 0.0,
                   mileage: 0,
                   isCharging: false)
    }
    
    static var evDemo: StatusData {
        StatusData(powerPercent: 0.7,
                   fuelPercent: 0.0,
                   fuelDuration: 0,
                   oilPercent: 0.0,
                   mileagePercent: 0.0,
                   mileage: 0,
                   isCharging: true)
    }
}
