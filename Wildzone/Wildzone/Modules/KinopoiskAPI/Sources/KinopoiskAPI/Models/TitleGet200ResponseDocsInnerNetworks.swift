//
// TitleGet200ResponseDocsInnerNetworks.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TitleGet200ResponseDocsInnerNetworks: Codable, JSONEncodable, Hashable {

    public var items: [TitleGet200ResponseDocsInnerNetworksItemsInner]

    public init(items: [TitleGet200ResponseDocsInnerNetworksItemsInner]) {
        self.items = items
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case items
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
    }
}

