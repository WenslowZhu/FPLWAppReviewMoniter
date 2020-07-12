//
//  UserExperenceType.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/12.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

class UserExperence: ObservableObject {
    @Published var userExperenceType: UserExperenceType
    @Published var remoteControlSuccess = false
    
    init(userExperenceType: UserExperenceType = .unknow) {
        self.userExperenceType = userExperenceType
    }
    
    static var blueDemo: UserExperence {
        UserExperence(userExperenceType: .blue)
    }
}

enum UserExperenceType: String {
    case blue
    case focus
    case unknow
}
