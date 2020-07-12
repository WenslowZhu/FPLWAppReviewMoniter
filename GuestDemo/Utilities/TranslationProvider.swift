//
//  TranslationProvider.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import Foundation

struct TranslationProvider {
    static let home = HomeTranslation()
}

struct HomeTranslation {
    let title = "首页"
    let focusStart = "启动"
    let focusStop = "熄火"
    let remoteControlSuccess = "远控成功"
}
