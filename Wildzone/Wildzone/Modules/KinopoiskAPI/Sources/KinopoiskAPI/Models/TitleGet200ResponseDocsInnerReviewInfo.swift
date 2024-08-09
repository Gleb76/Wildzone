//
// TitleGet200ResponseDocsInnerReviewInfo.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TitleGet200ResponseDocsInnerReviewInfo: Codable, JSONEncodable, Hashable {

    public var count: Double
    public var positiveCount: Double
    public var percentage: String

    public init(count: Double, positiveCount: Double, percentage: String) {
        self.count = count
        self.positiveCount = positiveCount
        self.percentage = percentage
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case count
        case positiveCount
        case percentage
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
        try container.encode(positiveCount, forKey: .positiveCount)
        try container.encode(percentage, forKey: .percentage)
    }
}
