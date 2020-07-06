//
//  ImageURLStore.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/6.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import Foundation

fileprivate var fordImageURLHost: String {
    #if DEBUG
    return "https://www.fordpass.com.cn/content/dam/assets/cn"
    #else
    return "https://www.fordpass.com.cn/content/dam/assets/cn"
    #endif
}

fileprivate var lincolnImageURLHost: String {
    #if DEBUG
    return "https://www.fordpass.com.cn/content/dam/assets/cn"
    #else
    return "https://www.fordpass.com.cn/content/dam/assets/cn"
    #endif
}

public enum FordHomeImageURL: String {
    case acclandingbg = "acclandingbg.png"
    case authAssets = "authAssets.png"
    case homeBackground = "homeBackground.png"
    case rnr_encrypted = "rnr_encrypted.png"
    case smart_card_guides = "smart_card_guides.png"
    case smart_card_map = "smart_card_map.png"
    case smart_card_osb = "smart_card_osb.png"
    case smart_card_vehicle = "smart_card_vehicle.png"
    case smart_card_welcome = "smart_card_welcome.png"

    public var urlString: String {
        return fordImageURLHost + "/ford/home/" + self.rawValue
    }
}

public enum FordEvssImageURL: String {
    case unlimitedECardBg = "unlimitedECardBg.png"
    case ecardActiveBg = "ecardActiveBg.png"
    case ecardInactiveBg = "ecardCellBg.png"
    case experienceCardBg = "experienceCardBg.png"
    case dev1 = "dev1.png"
    case dev2 = "dev2.png"
    case dev3 = "dev3.png"
    case dev4 = "dev4.png"
    case activeIntroduce = "activeIntroduce.png"
    case oval = "oval.png"

    public var urlString: String {
        return fordImageURLHost + "/ford/bev/" + self.rawValue
    }
}

public enum LincolnHomeImageURL: String {
    case acclandingbg = "acclandingbg.jpg"
    case authAssets = "authAssets.png"
    case homeBackground = "homeBackground.png"
    case rnr_encrypted = "rnr_encrypted.png"
    case smart_card_aar = "smart_card_aar.png"
    case smart_card_ev = "smart_card_ev.png"
    case smart_card_paak = "smart_card_paak.png"
    case smart_card_guides = "smart_card_guides.png"
    case smart_card_map = "smart_card_map.png"
    case smart_card_osb = "smart_card_osb.png"
    case smart_card_vehicle = "smart_card_vehicle.png"
    case smart_card_welcome = "smart_card_welcome.png"

    public var urlString: String {
        return lincolnImageURLHost + "/lincoln/home/" + self.rawValue
    }
}

public enum LincolnServiceImageURL: String {
    case didiLuxuryVehicle = "didi.jpg"
    
    public var urlString: String {
        return lincolnImageURLHost + "/lincoln/service/" + self.rawValue
    }
}

