//
//  MainViewModel.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import Foundation
import Apollo
import ApolloAPI

class MainViewModel: ObservableObject {
    
    @Published private(set) var tokenBalancesData: AirStackAPI.TokenBalancesQuery.Data?
    @Published private(set) var error: Error?
    
    private let gqlClient: GraphQLClient = GraphQLClient()
    
    func fetchTokenBalances(owner: String) {
        gqlClient.fetchTokenBalances(owner: owner) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    
                    data.tokenBalances?.tokenBalance?.forEach({ balance in
                        print("name: \(balance.tokenNfts?.metaData?.name)")
                        print("image: \(balance.tokenNfts?.metaData?.image)")
                    })
                    
                    self?.tokenBalancesData = data
                    
                case.failure(let error):
                    print(error)
                    self?.error = error
                }
            }
        }
    }
    
}
