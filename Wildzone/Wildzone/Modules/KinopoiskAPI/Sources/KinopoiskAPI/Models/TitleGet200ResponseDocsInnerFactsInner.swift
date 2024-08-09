//
// TitleGet200ResponseDocsInnerFactsInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TitleGet200ResponseDocsInnerFactsInner: Codable, JSONEncodable, Hashable {

    public var value: String?
    public var type: String?
    public var spoiler: Bool?

    public init(value: String? = nil, type: String? = nil, spoiler: Bool? = nil) {
        self.value = value
        self.type = type
        self.spoiler = spoiler
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case value
        case type
        case spoiler
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(spoiler, forKey: .spoiler)
    }
}
