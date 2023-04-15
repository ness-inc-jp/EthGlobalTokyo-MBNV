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
import BottomSheet

struct MainView: View {
    
    @EnvironmentObject var ethereum: Ethereum
    @StateObject private var viewModel = MainViewModel()
    
    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    @State var selectedNFT: DetailNFT?
    
    let images = ["image1", "image2", "image3"]
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Text(getRandomEmoji())
                            .font(.title3)
                    }
                    .padding(.all, 12)
                    .background(.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                    
                    
                }
                .overlay(content: {
                    Text("MBNV")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        
                })
                .padding(.bottom, 4)
                
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
                                        .onTapGesture {
                                            bottomSheetPosition = .absolute(UIScreen.main.bounds.height)
                                            
                                            let metadataName = balance.tokenNfts?.metaData?.name
                                            let tokenName = balance.token?.name
                                            
                                            selectedNFT = DetailNFT(
                                                name: metadataName ?? tokenName ?? "",
                                                tokenId: balance.tokenId ?? "",
                                                imageUrl: imageUrl
                                            )
                                        }
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
            
            Rectangle()
                .frame(width: 0, height: 0)
                .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [bottomSheetPosition]) {
                    if let detailNFT = selectedNFT {
                        NFTDetailView(detailNFT: detailNFT)
                    }
                }
                .enableBackgroundBlur(true)
                .backgroundBlurMaterial(.dark(.thin))
                .enableContentDrag()
                .enableSwipeToDismiss()
                .showDragIndicator(false)
                .ignoresSafeArea()
        }
        .onAppear {
            viewModel.fetchTokenBalances(owner: ethereum.selectedAddress)
//            viewModel.fetchTokenBalances(owner: "2-bit.eth")
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
