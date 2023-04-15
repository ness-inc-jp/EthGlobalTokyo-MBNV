// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension AirStackAPI {
  class TokenBalancesQuery: GraphQLQuery {
    public static let operationName: String = "TokenBalancesQuery"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query TokenBalancesQuery($input: TokenBalancesInput!) {
          TokenBalances(input: $input) {
            __typename
            TokenBalance {
              __typename
              token {
                __typename
                name
                symbol
              }
              tokenNfts {
                __typename
                metaData {
                  __typename
                  name
                  image
                  description
                }
              }
              tokenAddress
              tokenId
              lastUpdatedTimestamp
            }
          }
        }
        """#
      ))

    public var input: TokenBalancesInput

    public init(input: TokenBalancesInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    public struct Data: AirStackAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("TokenBalances", TokenBalances?.self, arguments: ["input": .variable("input")]),
      ] }

      public var tokenBalances: TokenBalances? { __data["TokenBalances"] }

      /// TokenBalances
      ///
      /// Parent Type: `TokenBalancesOutput`
      public struct TokenBalances: AirStackAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.TokenBalancesOutput }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("TokenBalance", [TokenBalance]?.self),
        ] }

        public var tokenBalance: [TokenBalance]? { __data["TokenBalance"] }

        /// TokenBalances.TokenBalance
        ///
        /// Parent Type: `TokenBalance`
        public struct TokenBalance: AirStackAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.TokenBalance }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("token", Token?.self),
            .field("tokenNfts", TokenNfts?.self),
            .field("tokenAddress", AirStackAPI.Address.self),
            .field("tokenId", String?.self),
            .field("lastUpdatedTimestamp", AirStackAPI.Time?.self),
          ] }

          ///  Nested Query - allows retrieving token contract level data 
          public var token: Token? { __data["token"] }
          ///  Nested Query - allows retrieving token NFT contract level data, such as images, traits, and so on 
          public var tokenNfts: TokenNfts? { __data["tokenNfts"] }
          ///  Smart contract address of the token 
          public var tokenAddress: AirStackAPI.Address { __data["tokenAddress"] }
          ///  Unique NFT token ID 
          public var tokenId: String? { __data["tokenId"] }
          ///  Timestamp of the latest token balance change happened 
          public var lastUpdatedTimestamp: AirStackAPI.Time? { __data["lastUpdatedTimestamp"] }

          /// TokenBalances.TokenBalance.Token
          ///
          /// Parent Type: `Token`
          public struct Token: AirStackAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.Token }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
              .field("symbol", String?.self),
            ] }

            ///  Name of the token, mirrored from the smart contract 
            public var name: String? { __data["name"] }
            ///  Symbol of the token, mirrored from the smart contract 
            public var symbol: String? { __data["symbol"] }
          }

          /// TokenBalances.TokenBalance.TokenNfts
          ///
          /// Parent Type: `TokenNft`
          public struct TokenNfts: AirStackAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.TokenNft }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("metaData", MetaData?.self),
            ] }

            ///  NFT token metadata and attributes
            public var metaData: MetaData? { __data["metaData"] }

            /// TokenBalances.TokenBalance.TokenNfts.MetaData
            ///
            /// Parent Type: `NftMetadata`
            public struct MetaData: AirStackAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.NftMetadata }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("name", String?.self),
                .field("image", String?.self),
                .field("description", String?.self),
              ] }

              ///  Name of the token, mirrored from the smart contract 
              public var name: String? { __data["name"] }
              ///  Link to the token image, mirrored from the smart contract 
              public var image: String? { __data["image"] }
              ///  Description of the token, mirrored from the smart contract 
              public var description: String? { __data["description"] }
            }
          }
        }
      }
    }
  }

}