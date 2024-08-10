//
//  PostersGetProvider.swift
//
//
//  Created by Назар Ткаченко on 10.08.2024.
//

import Foundation

public struct PostersGetProvider {
    
    public init() {}
    
    mutating public func searchFilms(
        movieId: [String],
        type: [String],
        language: [String],
        height: [String],
        width: [String],
        updatedAt: [String],
        createdAt: [String],
        complete: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void
    ) {
        KinopoiskAPI.postersGet(
            movieId: movieId,
            type: type,
            language: language,
            height: height,
            width: width,
            updatedAt: updatedAt,
            createdAt: createdAt) { data, error in
                complete(data, error)
            }
    }
}
