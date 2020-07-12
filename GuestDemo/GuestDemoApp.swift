//
//  GuestDemoApp.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/4.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

@main
struct GuestDemoApp: App {
    
    var userExperence = UserExperence()
    @State var didGetURL = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userExperence)
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                    guard let url = userActivity.webpageURL, !didGetURL else { return }
                    
                    didGetURL.toggle()
                    
                    if url.absoluteString.contains(UserExperenceType.blue.rawValue) {
                        userExperence.userExperenceType = .blue
                    } else if url.absoluteString.contains(UserExperenceType.focus.rawValue) {
                        userExperence.userExperenceType = .focus
                    } else {
                        userExperence.userExperenceType = .unknow
                    }
                    
                    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                        didGetURL.toggle()
                    }
                }
        }
    }
}

struct GuestDemoApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
