//
//  AppState.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import Foundation
import Apollo
import ApolloAPI

class GraphQLClient {
    
    static let shared = GraphQLClient()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.airstack.xyz/gql")!)
    
    func fetchTokenBalances(owner: String, compleation: @escaping (Result<AirStackAPI.TokenBalancesQuery.Data, Error>) -> Void) {
        
        let ethereumInput = AirStackAPI.TokenBalancesInput(
            filter: .init(owner: .some(.init(_eq: GraphQLNullable(stringLiteral: owner)))),
            blockchain: .init(.ethereum)
        )
        
        let polygonInput = 
        
        GraphQLClient.shared.apollo.fetch(query: AirStackAPI.TokenBalancesQuery(input: input)) { result in
            switch result {
            case .success(let gqlResult):
                if let data = gqlResult.data {
                    compleation(.success(data))
                } else if let errors = gqlResult.errors {
                    compleation(.failure(NSError(domain: "GraphQL errors", code: -1, userInfo: ["errors": errors])))
                }
                
            case .failure(let error):
                compleation(.failure(error))
            }
        }
    }
    
}

