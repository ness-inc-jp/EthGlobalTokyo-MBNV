//
//  LoginView.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import SwiftUI
import Combine
import metamask_ios_sdk

struct LoginView: View {
    
    @EnvironmentObject var ethereum: Ethereum
    
    @State private var cancellables: Set<AnyCancellable> = []
    @State private var isProgressing: Bool = false
    @State private var isError: Bool = false
    @State private var errorMessage: String = ""

    
    let dapp = Dapp(name: "EthTokyoApp", url: "https://eth-tokyo-app.com")
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 4) {
                Text("MBNV")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Most Beatiful NFT Viewer")
            }
            .foregroundColor(.white)
            .padding(.top, -120)
            
            
            VStack {
                
                Spacer()
                
                Button {
                    
                    isProgressing = true
                    ethereum.connect(dapp)?.sink(receiveCompletion: { completion in
                        
                        switch completion {
                        case .failure(let error):
                            isProgressing = false
                            isError = true
                            errorMessage = error.localizedDescription
                            print("Connection Error: \(errorMessage)")
                        
                        default: break
                        }
                        
                    }, receiveValue: { result in
                        
                        isProgressing = false
                        ethereum.selectedAddress = result as! String
                        
                    }).store(in: &cancellables)
                    
                } label: {
                    
                    Text("Connect MetaMask")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color.white.cornerRadius(16))
                        .padding(.horizontal, 40)
                    
                }
                .padding(.bottom, 60)
            }
            .padding()
            .alert(isPresented: $isError) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK")) {
                        errorMessage = ""
                        isError = false
                    }
                )
        }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(MetaMaskSDK.shared.ethereum)
    }
}
