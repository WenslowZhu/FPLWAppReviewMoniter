//
//  FordColor.swift
//  FordUIKit_iOS
//
//  Created by Zhu, Ting (T.) on 2020/5/20.
//

import SwiftUI

public enum FordColor: String, Codable, CaseIterable {
    /// Brand Color
    case primary_blue
    case primary_dark
    case primary_light

    /// Feedback Color
    case success_green
    case warning_orange
    case error_red

    /// Background Color
    case bg_100

    /// Card Color
    case card_100

    /// Icon Color
    case icon_100

    /// Disabled Button Color
    case disable_button
    case disable_outline

    /// Text Color
    case text_100
    case text_85
    case text_60
    case text_50
    case text_30
}

extension FordColor {
    
    public var hexColor: UIColor {
        return UIColor(named: "Ford/\(fordColorAssetName)") ?? UIColor.red
    }
    
    public var color: Color {
        return Color("Ford/\(fordColorAssetName)")
    }
    
    private var fordColorAssetName: String {
        switch self {
        case .primary_blue:
            return "primary_blue"
        case .primary_dark:
            return "primary_dark"
        case .primary_light:
            return "primary_light"
        case .success_green:
            return "success_green"
        case .warning_orange:
            return "warning_orange"
        case .error_red:
            return "error_red"
        case .bg_100:
            return "bg_100"
        case .card_100:
            return "card_100"
        case .icon_100:
            return "icon_100"
        case .disable_button:
            return "disable_button"
        case .disable_outline:
            return "disable_outline"
        case .text_100:
            return "text_100"
        case .text_85:
            return "text_85"
        case .text_60:
            return "text_60"
        case .text_50:
            return "text_50"
        case .text_30:
            return "text_30"
        }
    }
}

fileprivate class AClass {}
