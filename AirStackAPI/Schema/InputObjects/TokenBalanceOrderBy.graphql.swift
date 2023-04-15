// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct TokenBalanceOrderBy: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      lastUpdatedTimestamp: GraphQLNullable<GraphQLEnum<OrderBy>> = nil
    ) {
      __data = InputDict([
        "lastUpdatedTimestamp": lastUpdatedTimestamp
      ])
    }

    public var lastUpdatedTimestamp: GraphQLNullable<GraphQLEnum<OrderBy>> {
      get { __data["lastUpdatedTimestamp"] }
      set { __data["lastUpdatedTimestamp"] = newValue }
    }
  }

}