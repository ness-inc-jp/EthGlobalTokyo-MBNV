// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol AirStackAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AirStackAPI.SchemaMetadata {}

public protocol AirStackAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AirStackAPI.SchemaMetadata {}

public protocol AirStackAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AirStackAPI.SchemaMetadata {}

public protocol AirStackAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AirStackAPI.SchemaMetadata {}

public extension AirStackAPI {
  typealias ID = String

  typealias SelectionSet = AirStackAPI_SelectionSet

  typealias InlineFragment = AirStackAPI_InlineFragment

  typealias MutableSelectionSet = AirStackAPI_MutableSelectionSet

  typealias MutableInlineFragment = AirStackAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return AirStackAPI.Objects.Query
      case "TokenBalancesOutput": return AirStackAPI.Objects.TokenBalancesOutput
      case "TokenBalance": return AirStackAPI.Objects.TokenBalance
      case "Token": return AirStackAPI.Objects.Token
      case "TokenNft": return AirStackAPI.Objects.TokenNft
      case "NftMetadata": return AirStackAPI.Objects.NftMetadata
      case "TokensOutput": return AirStackAPI.Objects.TokensOutput
      case "Wallet": return AirStackAPI.Objects.Wallet
      case "Media": return AirStackAPI.Objects.Media
      case "ImageSizes": return AirStackAPI.Objects.ImageSizes
      case "PageInfo": return AirStackAPI.Objects.PageInfo
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}