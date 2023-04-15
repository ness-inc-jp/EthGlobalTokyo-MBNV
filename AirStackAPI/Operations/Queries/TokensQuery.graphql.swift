// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension AirStackAPI {
  class TokensQuery: GraphQLQuery {
    public static let operationName: String = "QB1"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query QB1($input: TokensInput!) {
          Tokens(input: $input) {
            __typename
            Token {
              __typename
              address
              baseURI
              chainId
              contractMetaDataURI
              decimals
              id
              lastTransferBlock
              lastTransferHash
              lastTransferTimestamp
              name
              rawContractMetaData
              symbol
              tokenBalances {
                __typename
                owner {
                  __typename
                  addresses
                }
                amount
              }
              tokenNfts {
                __typename
                id
                tokenId
                tokenURI
                metaData {
                  __typename
                  name
                }
                contentValue {
                  __typename
                  image {
                    __typename
                    large
                    medium
                    original
                    small
                    extraSmall
                  }
                }
              }
              totalSupply
              type
            }
            pageInfo {
              __typename
              nextCursor
              prevCursor
            }
          }
        }
        """#
      ))

    public var input: TokensInput

    public init(input: TokensInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    public struct Data: AirStackAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("Tokens", Tokens?.self, arguments: ["input": .variable("input")]),
      ] }

      public var tokens: Tokens? { __data["Tokens"] }

      /// Tokens
      ///
      /// Parent Type: `TokensOutput`
      public struct Tokens: AirStackAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.TokensOutput }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("Token", [Token]?.self),
          .field("pageInfo", PageInfo?.self),
        ] }

        public var token: [Token]? { __data["Token"] }
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// Tokens.Token
        ///
        /// Parent Type: `Token`
        public struct Token: AirStackAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.Token }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("address", AirStackAPI.Address.self),
            .field("baseURI", String?.self),
            .field("chainId", String?.self),
            .field("contractMetaDataURI", String?.self),
            .field("decimals", Int?.self),
            .field("id", AirStackAPI.ID?.self),
            .field("lastTransferBlock", Int?.self),
            .field("lastTransferHash", String?.self),
            .field("lastTransferTimestamp", AirStackAPI.Time?.self),
            .field("name", String?.self),
            .field("rawContractMetaData", AirStackAPI.Map?.self),
            .field("symbol", String?.self),
            .field("tokenBalances", [TokenBalance]?.self),
            .field("tokenNfts", [TokenNft]?.self),
            .field("totalSupply", String?.self),
            .field("type", GraphQLEnum<AirStackAPI.TokenType>?.self),
          ] }

          ///  Smart contract address of the token 
          public var address: AirStackAPI.Address { __data["address"] }
          ///  Base URI of the token contract 
          public var baseURI: String? { __data["baseURI"] }
          /// Airstack unique identifier for the blockchain
          public var chainId: String? { __data["chainId"] }
          ///  URI for the token's contract metadata 
          public var contractMetaDataURI: String? { __data["contractMetaDataURI"] }
          ///  The number of decimal places this token uses, default to 18 
          public var decimals: Int? { __data["decimals"] }
          ///  Airstack unique identifier for the contract 
          public var id: AirStackAPI.ID? { __data["id"] }
          ///  Block number of the token's most recent transfer 
          public var lastTransferBlock: Int? { __data["lastTransferBlock"] }
          ///  Transaction hash of the token's most recent transfer 
          public var lastTransferHash: String? { __data["lastTransferHash"] }
          ///  Timestamp of the token's most recent transfer 
          public var lastTransferTimestamp: AirStackAPI.Time? { __data["lastTransferTimestamp"] }
          ///  Name of the token, mirrored from the smart contract 
          public var name: String? { __data["name"] }
          ///  Token contract metadata as it appears inside the contract 
          public var rawContractMetaData: AirStackAPI.Map? { __data["rawContractMetaData"] }
          ///  Symbol of the token, mirrored from the smart contract 
          public var symbol: String? { __data["symbol"] }
          ///  Nested Query - allows querying the tokenBalance information 
          public var tokenBalances: [TokenBalance]? { __data["tokenBalances"] }
          ///  Nested Query - allows querying the tokenNFTs information 
          public var tokenNfts: [TokenNft]? { __data["tokenNfts"] }
          ///  Amount of tokens in the protocol 
          public var totalSupply: String? { __data["totalSupply"] }
          ///  Token type: ERC20, ERC721, or ERC1155 
          public var type: GraphQLEnum<AirStackAPI.TokenType>? { __data["type"] }

          /// Tokens.Token.TokenBalance
          ///
          /// Parent Type: `TokenBalance`
          public struct TokenBalance: AirStackAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.TokenBalance }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("owner", Owner.self),
              .field("amount", String.self),
            ] }

            ///  Nested Query allowing to retrieve address, domain names, social profiles of the owner
            public var owner: Owner { __data["owner"] }
            ///  Token amount the address currently holds
            public var amount: String { __data["amount"] }

            /// Tokens.Token.TokenBalance.Owner
            ///
            /// Parent Type: `Wallet`
            public struct Owner: AirStackAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.Wallet }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("addresses", [AirStackAPI.Address]?.self),
              ] }

              ///  Returns addresses associated with the identity input 
              public var addresses: [AirStackAPI.Address]? { __data["addresses"] }
            }
          }

          /// Tokens.Token.TokenNft
          ///
          /// Parent Type: `TokenNft`
          public struct TokenNft: AirStackAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.TokenNft }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", AirStackAPI.ID.self),
              .field("tokenId", String.self),
              .field("tokenURI", String?.self),
              .field("metaData", MetaData?.self),
              .field("contentValue", ContentValue?.self),
            ] }

            ///  Airstack unique identifier for the NFT token 
            public var id: AirStackAPI.ID { __data["id"] }
            ///  Unique NFT token ID 
            public var tokenId: String { __data["tokenId"] }
            ///  NFT token URI 
            public var tokenURI: String? { __data["tokenURI"] }
            ///  NFT token metadata and attributes
            public var metaData: MetaData? { __data["metaData"] }
            ///  NFT Media - resized images, animation, videos, etc. 
            public var contentValue: ContentValue? { __data["contentValue"] }

            /// Tokens.Token.TokenNft.MetaData
            ///
            /// Parent Type: `NftMetadata`
            public struct MetaData: AirStackAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.NftMetadata }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("name", String?.self),
              ] }

              ///  Name of the token, mirrored from the smart contract 
              public var name: String? { __data["name"] }
            }

            /// Tokens.Token.TokenNft.ContentValue
            ///
            /// Parent Type: `Media`
            public struct ContentValue: AirStackAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.Media }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("image", Image?.self),
              ] }

              public var image: Image? { __data["image"] }

              /// Tokens.Token.TokenNft.ContentValue.Image
              ///
              /// Parent Type: `ImageSizes`
              public struct Image: AirStackAPI.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.ImageSizes }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("large", String?.self),
                  .field("medium", String?.self),
                  .field("original", String?.self),
                  .field("small", String?.self),
                  .field("extraSmall", String?.self),
                ] }

                public var large: String? { __data["large"] }
                public var medium: String? { __data["medium"] }
                public var original: String? { __data["original"] }
                public var small: String? { __data["small"] }
                public var extraSmall: String? { __data["extraSmall"] }
              }
            }
          }
        }

        /// Tokens.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AirStackAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AirStackAPI.Objects.PageInfo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nextCursor", String.self),
            .field("prevCursor", String.self),
          ] }

          public var nextCursor: String { __data["nextCursor"] }
          public var prevCursor: String { __data["prevCursor"] }
        }
      }
    }
  }

}
