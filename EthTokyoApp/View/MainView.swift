//
//  MainView.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import SwiftUI
import metamask_ios_sdk

struct MainView: View {
    
    @EnvironmentObject var ethereum: Ethereum
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            if let tokenBalancesData = viewModel.tokenBalancesData,
               let tokenBalance = tokenBalancesData.tokenBalances?.tokenBalance {
                
                List(tokenBalance, id: \.self) { tokenBalance in
                    VStack(alignment: .leading) {
                        Text(tokenBalance.tokenNfts?.metaData?.name ?? "")
                            .font(.headline)
                        
                        Text(tokenBalance.tokenNfts?.metaData?.description ?? "")
                            .font(.subheadline)
                    }
                }
                
            }
            
        }
        .onAppear {
            viewModel.fetchTokenBalances(owner: ethereum.selectedAddress)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MetaMaskSDK.shared.ethereum)
    }
}
