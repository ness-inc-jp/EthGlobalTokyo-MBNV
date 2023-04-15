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
        
        let input = AirStackAPI.TokenBalancesInput(
            filter: .init(
                owner: .some(.init(_eq: GraphQLNullable(stringLiteral: owner))),
                tokenType: .some(.init(_in: GraphQLNullable(arrayLiteral: GraphQLEnum(AirStackAPI.TokenType.erc721), GraphQLEnum(AirStackAPI.TokenType.erc1155))))
            ),
            blockchain: .init(.ethereum),
            limit: 10
        )
        
        GraphQLClient.shared.apollo.fetch(query: AirStackAPI.TokenBalancesQuery(input: input)) { result in
            switch result {
            case .success(let gqlResult):
                if let data = gqlResult.data {
                    data.tokenBalances?.tokenBalance?.forEach({ token in
                        
                    })
                    compleation(.success(data))
                } else if let errors = gqlResult.errors {
                    compleation(.failure(NSError(domain: "GraphQL errors", code: -1, userInfo: ["errors": errors])))
                }
                
            case .failure(let error):
                compleation(.failure(error))
            }
        }
    }
    
    
    func fetchTokens(address: String, compleation: @escaping (Result<AirStackAPI.TokensQuery.Data, Error>) -> Void) {
        
        let input = AirStackAPI.TokensInput(
            filter: .init(address: .some(.init(_eq: GraphQLNullable(stringLiteral: address)))),
            blockchain: .init(.ethereum),
            limit: 20
        )
        
        GraphQLClient.shared.apollo.fetch(query: AirStackAPI.TokensQuery(input: input)) { result in
            switch result {
            case .success(let gqlResult):
                if let data = gqlResult.data {
                    compleation(.success(data))
                } else if let errors = gqlResult.errors {
                    compleation(.failure(NSError(domain: "GraphQL erros", code: -1, userInfo: ["errors": errors])))
                }
                
            case .failure(let error):
                compleation(.failure(error))
            }
            
        }
    }
}

