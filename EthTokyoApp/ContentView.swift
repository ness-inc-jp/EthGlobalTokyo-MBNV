//
//  ContentView.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import SwiftUI
import metamask_ios_sdk

struct ContentView: View {
    
    @EnvironmentObject var ethereum: Ethereum
    
    var body: some View {
            
        if ethereum.selectedAddress.isEmpty {
            LoginView()
        } else {
            MainView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MetaMaskSDK.shared.ethereum)
    }
}
