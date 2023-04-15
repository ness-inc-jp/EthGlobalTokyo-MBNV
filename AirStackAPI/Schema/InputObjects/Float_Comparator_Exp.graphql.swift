// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension AirStackAPI {
  struct Float_Comparator_Exp: InputObject {
    public private(set) var __data: InputDict

    public init(_ data: InputDict) {
      __data = data
    }

    public init(
      _eq: GraphQLNullable<Double> = nil,
      _gt: GraphQLNullable<Double> = nil,
      _gte: GraphQLNullable<Double> = nil,
      _lt: GraphQLNullable<Double> = nil,
      _lte: GraphQLNullable<Double> = nil,
      _ne: GraphQLNullable<Double> = nil,
      _in: GraphQLNullable<[Double]> = nil,
      _nin: GraphQLNullable<[Double]> = nil
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

    public var _eq: GraphQLNullable<Double> {
      get { __data["_eq"] }
      set { __data["_eq"] = newValue }
    }

    public var _gt: GraphQLNullable<Double> {
      get { __data["_gt"] }
      set { __data["_gt"] = newValue }
    }

    public var _gte: GraphQLNullable<Double> {
      get { __data["_gte"] }
      set { __data["_gte"] = newValue }
    }

    public var _lt: GraphQLNullable<Double> {
      get { __data["_lt"] }
      set { __data["_lt"] = newValue }
    }

    public var _lte: GraphQLNullable<Double> {
      get { __data["_lte"] }
      set { __data["_lte"] = newValue }
    }

    public var _ne: GraphQLNullable<Double> {
      get { __data["_ne"] }
      set { __data["_ne"] = newValue }
    }

    public var _in: GraphQLNullable<[Double]> {
      get { __data["_in"] }
      set { __data["_in"] = newValue }
    }

    public var _nin: GraphQLNullable<[Double]> {
      get { __data["_nin"] }
      set { __data["_nin"] = newValue }
    }
  }

}