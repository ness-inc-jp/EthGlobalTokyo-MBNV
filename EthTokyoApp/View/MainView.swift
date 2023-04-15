//
//  MainView.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import SwiftUI
import metamask_ios_sdk
import SDWebImageSwiftUI
import WaterfallGrid

struct MainView: View {
    
    @EnvironmentObject var ethereum: Ethereum
    @StateObject private var viewModel = MainViewModel()
    
    let images = ["image1", "image2", "image3"]
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if let tokenBalancesData = viewModel.tokenBalancesData,
                       let tokenBalance = tokenBalancesData.tokenBalances?.tokenBalance {

                        WaterfallGrid(tokenBalance, id: \.self) { balance in

                            Group {
                                if let image = balance.tokenNfts?.metaData?.image,
                                   let imageUrl = URL(string: convertHttpToIpfs(str: image)) {
                                    WebImage(url: imageUrl)
                                        .resizable()
                                        .indicator(.activity)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }

                        }
                        .gridStyle(
                            columns: tokenBalance.count > 20 ? 3 : 2,
                            spacing: 10,
                            animation: .easeInOut
                        )

                    }

                }
                
            }
            
        }
        .onAppear {
//            viewModel.fetchTokenBalances(owner: ethereum.selectedAddress)
            viewModel.fetchTokenBalances(owner: "2-bit.eth")
        }
        
    }
    
    func convertHttpToIpfs(str: String) -> String {
        if str.starts(with: "ipfs://") {
            let ipfsPath = str.replacingOccurrences(of: "ipfs://", with: "")
            return "https://ipfs.io/ipfs/\(ipfsPath)"
        } else {
            return str
        }
    }

    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MetaMaskSDK.shared.ethereum)
    }
}
