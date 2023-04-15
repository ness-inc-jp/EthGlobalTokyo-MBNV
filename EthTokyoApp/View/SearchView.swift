//
//  SearchView.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/16.
//

import SwiftUI
import WaterfallGrid
import SDWebImageSwiftUI
import BottomSheet

struct SearchView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = SearchViewModel()
    @State var searchText: String = ""
    
    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    @State var selectedNFT: DetailNFT?
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white.opacity(0.3))
                    }
                    .padding(.trailing, 6)

                    
                    
                    TextField("Type your search",text: $searchText)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(10)
                        .background(.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    
                    Button {
                        guard !searchText.isEmpty else { return }
                        viewModel.fetchTokens(address: searchText)
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(11)
                    .background(.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    
                }
                .padding(.bottom, 8)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if let tokenData = viewModel.tokenData,
                       let token = tokenData.tokens?.token?[0],
                       let tokenNfts = token.tokenNfts {
                        
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                            ForEach(tokenNfts, id: \.self) { tokenNft in
                                    
                                if let imageString = tokenNft.contentValue?.image?.small,
                                   let imageUrl = URL(string: imageString) {
                                    
                                    WebImage(url: imageUrl)
                                        .resizable()
                                        .indicator(.activity)
                                        .aspectRatio(contentMode: .fit)
                                        .onTapGesture {
                                            
                                            let detailNFT = DetailNFT(
                                                name: token.name ?? "",
                                                tokenId: token.id ?? "",
                                                imageUrl: imageUrl)
                                            
                                            selectedNFT = detailNFT
                                            
                                            bottomSheetPosition = .absolute(UIScreen.main.bounds.height)
                                        }
                                    
                                }
                                
                            }
                        }
                        
                    } else {
                        Text("Let's Search")
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.top, 60)
                    }
                    
                }
                
            }
            .padding(.horizontal)
            
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
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
