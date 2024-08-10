//
// ErrorModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

// MARK: - MovieResponseModel
public struct MovieResponseModel: Codable {
    public let docs: [DocModel]?
    public let total, limit, page, pages: Int?

    public init(docs: [DocModel]?, total: Int?, limit: Int?, page: Int?, pages: Int?) {
        self.docs = docs
        self.total = total
        self.limit = limit
        self.page = page
        self.pages = pages
    }
}

// MARK: - DocModel
public struct DocModel: Codable {
    public let internalNames: [String]?
    public let name, alternativeName, enName: String?
    public let year: Int?
    public let genres, countries: [CountryModel]?
    public let releaseYears: [ReleaseYearModel]?
    public let id: Int?
    public let externalID: ExternalIDModel?
    public let names: [NameModel]?
    public let type: TypeEnum?
    public let description, shortDescription: String?
    public let logo: LogoModel?
    public let poster, backdrop: BackdropModel?
    public let rating, votes: RatingModel?
    public let movieLength: Int?
    public let internalRating: Double?
    public let internalVotes: Int?
    public let isSeries, ticketsOnSale: Bool?
    public let totalSeriesLength: JSONNull?
    public let seriesLength: Int?
    public let ratingMPAA: String?
    public let ageRating: Int?
    public let top10: JSONNull?
    public let top250: Int?
    public let typeNumber: Int?
    public let status: String?

    public enum CodingKeys: String, CodingKey {
        case internalNames, name, alternativeName, enName, year, genres, countries, releaseYears, id
        case externalID = "externalId"
        case names, type, description, shortDescription, logo, poster, backdrop, rating, votes, movieLength, internalRating, internalVotes, isSeries, ticketsOnSale, totalSeriesLength, seriesLength
        case ratingMPAA = "ratingMpaa"
        case ageRating, top10, top250, typeNumber, status
    }

    public init(internalNames: [String]?, name: String?, alternativeName: String?, enName: String?, year: Int?, genres: [CountryModel]?, countries: [CountryModel]?, releaseYears: [ReleaseYearModel]?, id: Int?, externalID: ExternalIDModel?, names: [NameModel]?, type: TypeEnum?, description: String?, shortDescription: String?, logo: LogoModel?, poster: BackdropModel?, backdrop: BackdropModel?, rating: RatingModel?, votes: RatingModel?, movieLength: Int?, internalRating: Double?, internalVotes: Int?, isSeries: Bool?, ticketsOnSale: Bool?, totalSeriesLength: JSONNull?, seriesLength: Int?, ratingMPAA: String?, ageRating: Int?, top10: JSONNull?, top250: Int?, typeNumber: Int?, status: String?) {
        self.internalNames = internalNames
        self.name = name
        self.alternativeName = alternativeName
        self.enName = enName
        self.year = year
        self.genres = genres
        self.countries = countries
        self.releaseYears = releaseYears
        self.id = id
        self.externalID = externalID
        self.names = names
        self.type = type
        self.description = description
        self.shortDescription = shortDescription
        self.logo = logo
        self.poster = poster
        self.backdrop = backdrop
        self.rating = rating
        self.votes = votes
        self.movieLength = movieLength
        self.internalRating = internalRating
        self.internalVotes = internalVotes
        self.isSeries = isSeries
        self.ticketsOnSale = ticketsOnSale
        self.totalSeriesLength = totalSeriesLength
        self.seriesLength = seriesLength
        self.ratingMPAA = ratingMPAA
        self.ageRating = ageRating
        self.top10 = top10
        self.top250 = top250
        self.typeNumber = typeNumber
        self.status = status
    }
}

// MARK: - BackdropModel
public struct BackdropModel: Codable {
    public let url, previewURL: String?

    public enum CodingKeys: String, CodingKey {
        case url
        case previewURL = "previewUrl"
    }

    public init(url: String?, previewURL: String?) {
        self.url = url
        self.previewURL = previewURL
    }
}

// MARK: - CountryModel
public struct CountryModel: Codable {
    public let name: String?

    public init(name: String?) {
        self.name = name
    }
}

// MARK: - ExternalIDModel
public struct ExternalIDModel: Codable {
    public let kpHD: String?
    public let tmdb: Int?
    public let imdb: String?

    public init(kpHD: String?, tmdb: Int?, imdb: String?) {
        self.kpHD = kpHD
        self.tmdb = tmdb
        self.imdb = imdb
    }
}

// MARK: - LogoModel
public struct LogoModel: Codable {
    public let url: String?

    public init(url: String?) {
        self.url = url
    }
}

// MARK: - NameModel
public struct NameModel: Codable {
    public let name: String?
    public let language, type: String?

    public init(name: String?, language: String?, type: String?) {
        self.name = name
        self.language = language
        self.type = type
    }
}

// MARK: - RatingModel
public struct RatingModel: Codable {
    public let kp, imdb, filmCritics, russianFilmCritics: Double?
    public let ratingAwait: Int?

    public enum CodingKeys: String, CodingKey {
        case kp, imdb, filmCritics, russianFilmCritics
        case ratingAwait = "await"
    }

    public init(kp: Double?, imdb: Double?, filmCritics: Double?, russianFilmCritics: Double?, ratingAwait: Int?) {
        self.kp = kp
        self.imdb = imdb
        self.filmCritics = filmCritics
        self.russianFilmCritics = russianFilmCritics
        self.ratingAwait = ratingAwait
    }
}

// MARK: - ReleaseYearModel
public struct ReleaseYearModel: Codable {
    public let start, end: Int?

    public init(start: Int?, end: Int?) {
        self.start = start
        self.end = end
    }
}

public enum TypeEnum: String, Codable {
    case cartoon = "cartoon"
    case movie = "movie"
    case tvSeries = "tv-series"
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public func hash(into hasher: inout Hasher) {
            // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

