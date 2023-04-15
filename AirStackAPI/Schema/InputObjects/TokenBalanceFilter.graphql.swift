// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct TokenBalanceFilter: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      _and: GraphQLNullable<[TokenBalanceFilter]> = nil,
      _or: GraphQLNullable<[TokenBalanceFilter]> = nil,
      _nor: GraphQLNullable<[TokenBalanceFilter]> = nil,
      tokenAddress: GraphQLNullable<Address_Comparator_Exp> = nil,
      tokenId: GraphQLNullable<String_Comparator_Exp> = nil,
      owner: GraphQLNullable<Identity_Comparator_Exp> = nil,
      formattedAmount: GraphQLNullable<Float_Comparator_Exp> = nil,
      tokenType: GraphQLNullable<TokenType_Comparator_Exp> = nil
    ) {
      __data = InputDict([
        "_and": _and,
        "_or": _or,
        "_nor": _nor,
        "tokenAddress": tokenAddress,
        "tokenId": tokenId,
        "owner": owner,
        "formattedAmount": formattedAmount,
        "tokenType": tokenType
      ])
    }

    public var _and: GraphQLNullable<[TokenBalanceFilter]> {
      get { __data["_and"] }
      set { __data["_and"] = newValue }
    }

    public var _or: GraphQLNullable<[TokenBalanceFilter]> {
      get { __data["_or"] }
      set { __data["_or"] = newValue }
    }

    public var _nor: GraphQLNullable<[TokenBalanceFilter]> {
      get { __data["_nor"] }
      set { __data["_nor"] = newValue }
    }

    public var tokenAddress: GraphQLNullable<Address_Comparator_Exp> {
      get { __data["tokenAddress"] }
      set { __data["tokenAddress"] = newValue }
    }

    public var tokenId: GraphQLNullable<String_Comparator_Exp> {
      get { __data["tokenId"] }
      set { __data["tokenId"] = newValue }
    }

    public var owner: GraphQLNullable<Identity_Comparator_Exp> {
      get { __data["owner"] }
      set { __data["owner"] = newValue }
    }

    public var formattedAmount: GraphQLNullable<Float_Comparator_Exp> {
      get { __data["formattedAmount"] }
      set { __data["formattedAmount"] = newValue }
    }

    public var tokenType: GraphQLNullable<TokenType_Comparator_Exp> {
      get { __data["tokenType"] }
      set { __data["tokenType"] = newValue }
    }
  }

}