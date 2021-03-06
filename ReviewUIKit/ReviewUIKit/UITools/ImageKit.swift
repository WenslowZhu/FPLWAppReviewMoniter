//
//  ImageKit.swift
//  Review
//
//  Created by tstone10 on 2019/8/6.
//  Copyright © 2019 Wenslow. All rights reserved.
//

import UIKit
import ReviewHelperKit

public enum ImageKit {
    case reviewTabBarImage
    case reviewTabBarSelectedImage
    case settingTabBarImage
    case settingTabBarSelectedImage
    case menuICONImage
    case addAppICONImage
    case refreshICONImage
    case primaryImage
    case secondImage
    case thirdImage
    case error
    case noResult
    
    public var value: UIImage? {
        return UIImage(named: imageName)
    }

    public static func currentAppICON() -> UIImage? {
        switch AppICONType.currentType() {
        case .primary:
            return ImageKit.primaryImage.value
        case .second:
            return ImageKit.secondImage.value
        case .third:
            return ImageKit.thirdImage.value
        }
    }

    private var imageName: String {
        switch self {
        case .reviewTabBarImage:
            return "review-unselected-item"
        case .reviewTabBarSelectedImage:
            return "reivew-item"
        case .settingTabBarImage:
            return "settings-unselected-item"
        case .settingTabBarSelectedImage:
            return "settings-item"
        case .menuICONImage:
            return "menu"
        case .addAppICONImage:
            return "plus"
        case .refreshICONImage:
            return "refresh"
        case .primaryImage:
            return "primary"
        case .secondImage:
            return "second"
        case .thirdImage:
            return "third"
        case .error:
            return "error"
        case .noResult:
            return "noResult"
        }
    }
    
    public static func portraitImageName() -> String {
        let portraitId = Int.random(in: 1...44)
        return String(format: "portrait/%02d", portraitId)
    }
}
