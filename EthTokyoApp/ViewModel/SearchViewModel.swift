//
//  SearchViewModel.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/16.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published private(set) var tokenData: AirStackAPI.TokensQuery.Data?
    @Published private(set) var error: Error?
    
    private let gqlClient: GraphQLClient = GraphQLClient()
    
    func fetchTokens(address: String) {
        gqlClient.fetchTokens(address: address) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    
                    let token = data.tokens?.token?[0]
                    let tokenNfts = token?.tokenNfts
                    
                    self?.tokenData = data
                    
                case.failure(let error):
                    print(error)
                    self?.error = error
                }
            }
            
        }
    }
}
