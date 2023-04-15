// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct Identity_Comparator_Exp: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      _eq: GraphQLNullable<Identity> = nil,
      _in: GraphQLNullable<[Identity]> = nil
    ) {
      __data = InputDict([
        "_eq": _eq,
        "_in": _in
      ])
    }

    public var _eq: GraphQLNullable<Identity> {
      get { __data["_eq"] }
      set { __data["_eq"] = newValue }
    }

    public var _in: GraphQLNullable<[Identity]> {
      get { __data["_in"] }
      set { __data["_in"] = newValue }
    }
  }

}