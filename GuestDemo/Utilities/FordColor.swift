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
    case primary_blue_clicked
    case primary_blue_outline
    case primary_blue_30

    /// Feedback Color
    case success_green
    case success_green_15
    case warning_orange
    case warning_orange_15
    case error_red

    /// Background Color
    case background
    case background_card

    /// Card Color
    case card

    /// Disabled Button Color
    case disable_gray_50
    case disable_gray_outline_50

    /// Preload Color
    case preload

    /// Separator Color
    case separator

    /// Mask Color
    case mask

    /// Progress Color
    case progress

    /// Dropdown Color
    case dropdown

    /// Icon Color
    case icon_100
    case icon_60
    case icon_30

    /// Text Color
    case text_100
    case text_85
    case text_60
    case text_50
    case text_30

    /// Clean
    case clean
}

extension FordColor {
    
    public var hexColor: UIColor {
        return UIColor(named: "Ford/\(self.rawValue)", in: Bundle(for: AClass.self), compatibleWith: nil) ?? UIColor.red
    }
    
    public var color: Color {
        return Color("Ford/\(self.rawValue)")
    }
}

fileprivate class AClass {}

