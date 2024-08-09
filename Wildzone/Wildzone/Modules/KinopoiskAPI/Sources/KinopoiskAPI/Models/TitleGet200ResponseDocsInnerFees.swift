//
// TitleGet200ResponseDocsInnerFees.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TitleGet200ResponseDocsInnerFees: Codable, JSONEncodable, Hashable {

    public var world: TitleGet200ResponseDocsInnerBudget
    public var russia: TitleGet200ResponseDocsInnerBudget
    public var usa: TitleGet200ResponseDocsInnerBudget

    public init(world: TitleGet200ResponseDocsInnerBudget, russia: TitleGet200ResponseDocsInnerBudget, usa: TitleGet200ResponseDocsInnerBudget) {
        self.world = world
        self.russia = russia
        self.usa = usa
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case world
        case russia
        case usa
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(world, forKey: .world)
        try container.encode(russia, forKey: .russia)
        try container.encode(usa, forKey: .usa)
    }
}

