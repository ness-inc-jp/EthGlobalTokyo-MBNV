//
//  EthTokyoAppApp.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import SwiftUI
import metamask_ios_sdk

@main
struct EthTokyoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MetaMaskSDK.shared.ethereum)
        }
    }
}
