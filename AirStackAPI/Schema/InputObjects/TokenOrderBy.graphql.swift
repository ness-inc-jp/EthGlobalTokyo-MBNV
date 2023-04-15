// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct TokenOrderBy: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      name: GraphQLNullable<GraphQLEnum<OrderBy>> = nil,
      symbol: GraphQLNullable<GraphQLEnum<OrderBy>> = nil,
      type: GraphQLNullable<GraphQLEnum<OrderBy>> = nil
    ) {
      __data = InputDict([
        "name": name,
        "symbol": symbol,
        "type": type
      ])
    }

    public var name: GraphQLNullable<GraphQLEnum<OrderBy>> {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    public var symbol: GraphQLNullable<GraphQLEnum<OrderBy>> {
      get { __data["symbol"] }
      set { __data["symbol"] = newValue }
    }

    public var type: GraphQLNullable<GraphQLEnum<OrderBy>> {
      get { __data["type"] }
      set { __data["type"] = newValue }
    }
  }

}