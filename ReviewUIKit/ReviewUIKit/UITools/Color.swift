//
//  FontKit.swift
//  Review
//
//  Created by tstone10 on 2019/8/6.
//  Copyright © 2019 Wenslow. All rights reserved.
//

import UIKit

public enum ColorKit {
    case labelTextColor
    case subLabelTextColor
    case backgroundColor
    case nameLabelColor
    case cloudColor
    case electronBlue
    case leafGreen
    case sunFlower
    case carrot
    case alizarin
    case midnightBlue
    case searchBarColor
    case cardBackground
    case navigationBar
    
    public var value: UIColor? {
        switch self {
        case .labelTextColor:
            return UIColor.label
        case .subLabelTextColor:
            return UIColor.systemGray
        case .backgroundColor:
            return UIColor.systemBackground
        case .nameLabelColor:
            return UIColor(named: "color/nameLabelColor")
        case .cloudColor:
            return UIColor(named: "color/cloud")
        case .electronBlue:
            return UIColor(named: "color/electronBlue")
        case .leafGreen:
            return UIColor(named: "color/leafGreen")
        case .sunFlower:
            return UIColor(named: "color/sunFlower")
        case .carrot:
            return UIColor(named: "color/carrot")
        case .alizarin:
            return UIColor(named: "color/alizarin")
        case .midnightBlue:
            return UIColor(named: "color/midnightBlue")
        case .searchBarColor:
            return UIColor(named: "color/searchBarColor")
        case .cardBackground:
            return UIColor(named: "color/cardBackground")
        case .navigationBar:
            return UIColor(named: "color/navigationBar")
        }
    }
}
