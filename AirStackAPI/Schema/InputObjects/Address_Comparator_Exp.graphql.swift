// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct Address_Comparator_Exp: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      _eq: GraphQLNullable<Address> = nil,
      _ne: GraphQLNullable<Address> = nil,
      _in: GraphQLNullable<[Address]> = nil,
      _nin: GraphQLNullable<[Address]> = nil
    ) {
      __data = InputDict([
        "_eq": _eq,
        "_ne": _ne,
        "_in": _in,
        "_nin": _nin
      ])
    }

    public var _eq: GraphQLNullable<Address> {
      get { __data["_eq"] }
      set { __data["_eq"] = newValue }
    }

    public var _ne: GraphQLNullable<Address> {
      get { __data["_ne"] }
      set { __data["_ne"] = newValue }
    }

    public var _in: GraphQLNullable<[Address]> {
      get { __data["_in"] }
      set { __data["_in"] = newValue }
    }

    public var _nin: GraphQLNullable<[Address]> {
      get { __data["_nin"] }
      set { __data["_nin"] = newValue }
    }
  }

}