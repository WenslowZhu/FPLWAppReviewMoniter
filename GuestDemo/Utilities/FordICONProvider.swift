//
//  FordICONProvider.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/11.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import Foundation

struct FordICONProvider {
    static let tabBarICON = TabBarICON()
    static let home = HomeICON()
    static let vehicle = VehicleICON()
    static let signIn = SignInICON()
}

struct TabBarICON {
    let homeActive = "tabBar/home_active"
    let homeInactice = "tabBar/home_inactive"
    let vehicleActive = "tabBar/vehicle_active"
    let vehicleInactive = "tabBar/vehicle_inactive"
    let mapActive = "tabBar/map_active"
    let mapInactive = "tabBar/map_inactive"
    let serviceActive = "tabBar/service_active"
    let serviceInactive = "tabBar/service_inactive"
    let mallActice = "tabBar/mall_active"
    let mallInactive = "tabBar/mall_inactive"
}

struct HomeICON {
    let blueVehicle = "home/blue"
    let blueCooling = "home/blueCooling"
    let blueCoolingSucceed = "home/blueCoolingSucceed"
    let blueHeating = "home/blueHeating"
    let blueHeatingSucceed = "home/blueHeatingSucceed"
    let blueLock = "home/blueLock"
    let blueLockSucceed = "home/blueLockSucceed"
    let blueUnlock = "home/blueUnlock"
    let blueUnlockSucceed = "home/blueUnlockSucceed"
    
    let focusVehicle = "home/focus"
    let focusLock = "home/focusLock"
    let focusLockeSucceed = "home/focusLockeSucceed"
    let focusStart = "home/focusStart"
    let focusStop = "home/focusStop"
    let focusUnlock = "home/focusUnlock"
    let focusUnlockSucceed = "home/focusUnlockSucceed"
}

struct VehicleICON {
    let vehicleLocation = "vehicle/vehicleLocation"
}

struct SignInICON {
    let vehicleLanding = "SignIn/vehicleLanding"
}