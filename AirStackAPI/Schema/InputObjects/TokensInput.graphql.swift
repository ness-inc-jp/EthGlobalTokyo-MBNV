// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct TokensInput: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      order: GraphQLNullable<[TokenOrderBy]> = nil,
      filter: TokenFilter,
      blockchain: GraphQLEnum<TokenBlockchain>,
      limit: GraphQLNullable<Int> = nil,
      cursor: GraphQLNullable<String> = nil
    ) {
      __data = InputDict([
        "order": order,
        "filter": filter,
        "blockchain": blockchain,
        "limit": limit,
        "cursor": cursor
      ])
    }

    public var order: GraphQLNullable<[TokenOrderBy]> {
      get { __data["order"] }
      set { __data["order"] = newValue }
    }

    public var filter: TokenFilter {
      get { __data["filter"] }
      set { __data["filter"] = newValue }
    }

    public var blockchain: GraphQLEnum<TokenBlockchain> {
      get { __data["blockchain"] }
      set { __data["blockchain"] = newValue }
    }

    public var limit: GraphQLNullable<Int> {
      get { __data["limit"] }
      set { __data["limit"] = newValue }
    }

    public var cursor: GraphQLNullable<String> {
      get { __data["cursor"] }
      set { __data["cursor"] = newValue }
    }
  }

}