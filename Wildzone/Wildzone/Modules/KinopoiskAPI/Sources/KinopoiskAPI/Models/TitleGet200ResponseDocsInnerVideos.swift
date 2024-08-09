//
// TitleGet200ResponseDocsInnerVideos.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TitleGet200ResponseDocsInnerVideos: Codable, JSONEncodable, Hashable {

    public var trailers: [TitleGet200ResponseDocsInnerVideosTrailersInner]

    public init(trailers: [TitleGet200ResponseDocsInnerVideosTrailersInner]) {
        self.trailers = trailers
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case trailers
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(trailers, forKey: .trailers)
    }
}
