//
//  ColorUtility.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/6/28.
//  Copyright © 2020 TZ. All rights reserved.
//

import Foundation
import SwiftUI

enum ColorUtility: String {
    case blue01 = "blue01"
    case blue02 = "blue02"
    case blue03 = "blue03"
    case gray01 = "gray01"
    case gray02 = "gray02"
    case green01 = "green01"
    case yellow01 = "yellow01"
    
    var color: Color {
        return Color("Color/\(self.rawValue)")
    }
}
