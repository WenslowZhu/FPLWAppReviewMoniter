//
//  SignInWithAppleButton.swift
//  GuestDemo
//
//  Created by 朱廷 on 2020/7/14.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}

