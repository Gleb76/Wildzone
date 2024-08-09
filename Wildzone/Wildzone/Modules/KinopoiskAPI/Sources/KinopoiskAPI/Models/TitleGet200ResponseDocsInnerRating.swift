//
// TitleGet200ResponseDocsInnerRating.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TitleGet200ResponseDocsInnerRating: Codable, JSONEncodable, Hashable {

    public var kp: Double
    public var imdb: Double
    public var tmdb: Double
    public var filmCritics: Double
    public var russianFilmCritics: Double
    public var await: Double

    public init(kp: Double, imdb: Double, tmdb: Double, filmCritics: Double, russianFilmCritics: Double, await: Double) {
        self.kp = kp
        self.imdb = imdb
        self.tmdb = tmdb
        self.filmCritics = filmCritics
        self.russianFilmCritics = russianFilmCritics
        self.await = await
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case kp
        case imdb
        case tmdb
        case filmCritics
        case russianFilmCritics
        case await
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(kp, forKey: .kp)
        try container.encode(imdb, forKey: .imdb)
        try container.encode(tmdb, forKey: .tmdb)
        try container.encode(filmCritics, forKey: .filmCritics)
        try container.encode(russianFilmCritics, forKey: .russianFilmCritics)
        try container.encode(await, forKey: .await)
    }
}
