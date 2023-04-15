// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct TokenFilter: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      _and: GraphQLNullable<[TokenFilter]> = nil,
      _or: GraphQLNullable<[TokenFilter]> = nil,
      _nor: GraphQLNullable<[TokenFilter]> = nil,
      address: GraphQLNullable<Address_Comparator_Exp> = nil,
      name: GraphQLNullable<String_Comparator_Exp> = nil,
      symbol: GraphQLNullable<String_Comparator_Exp> = nil,
      type: GraphQLNullable<TokenType_Comparator_Exp> = nil
    ) {
      __data = InputDict([
        "_and": _and,
        "_or": _or,
        "_nor": _nor,
        "address": address,
        "name": name,
        "symbol": symbol,
        "type": type
      ])
    }

    public var _and: GraphQLNullable<[TokenFilter]> {
      get { __data["_and"] }
      set { __data["_and"] = newValue }
    }

    public var _or: GraphQLNullable<[TokenFilter]> {
      get { __data["_or"] }
      set { __data["_or"] = newValue }
    }

    public var _nor: GraphQLNullable<[TokenFilter]> {
      get { __data["_nor"] }
      set { __data["_nor"] = newValue }
    }

    public var address: GraphQLNullable<Address_Comparator_Exp> {
      get { __data["address"] }
      set { __data["address"] = newValue }
    }

    public var name: GraphQLNullable<String_Comparator_Exp> {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    public var symbol: GraphQLNullable<String_Comparator_Exp> {
      get { __data["symbol"] }
      set { __data["symbol"] = newValue }
    }

    public var type: GraphQLNullable<TokenType_Comparator_Exp> {
      get { __data["type"] }
      set { __data["type"] = newValue }
    }
  }

}