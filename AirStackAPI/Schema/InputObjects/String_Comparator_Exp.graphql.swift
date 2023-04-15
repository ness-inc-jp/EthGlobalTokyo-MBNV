// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct String_Comparator_Exp: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      _eq: GraphQLNullable<String> = nil,
      _gt: GraphQLNullable<String> = nil,
      _gte: GraphQLNullable<String> = nil,
      _lt: GraphQLNullable<String> = nil,
      _lte: GraphQLNullable<String> = nil,
      _ne: GraphQLNullable<String> = nil,
      _in: GraphQLNullable<[String]> = nil,
      _nin: GraphQLNullable<[String]> = nil
    ) {
      __data = InputDict([
        "_eq": _eq,
        "_gt": _gt,
        "_gte": _gte,
        "_lt": _lt,
        "_lte": _lte,
        "_ne": _ne,
        "_in": _in,
        "_nin": _nin
      ])
    }

    public var _eq: GraphQLNullable<String> {
      get { __data["_eq"] }
      set { __data["_eq"] = newValue }
    }

    public var _gt: GraphQLNullable<String> {
      get { __data["_gt"] }
      set { __data["_gt"] = newValue }
    }

    public var _gte: GraphQLNullable<String> {
      get { __data["_gte"] }
      set { __data["_gte"] = newValue }
    }

    public var _lt: GraphQLNullable<String> {
      get { __data["_lt"] }
      set { __data["_lt"] = newValue }
    }

    public var _lte: GraphQLNullable<String> {
      get { __data["_lte"] }
      set { __data["_lte"] = newValue }
    }

    public var _ne: GraphQLNullable<String> {
      get { __data["_ne"] }
      set { __data["_ne"] = newValue }
    }

    public var _in: GraphQLNullable<[String]> {
      get { __data["_in"] }
      set { __data["_in"] = newValue }
    }

    public var _nin: GraphQLNullable<[String]> {
      get { __data["_nin"] }
      set { __data["_nin"] = newValue }
    }
  }

}