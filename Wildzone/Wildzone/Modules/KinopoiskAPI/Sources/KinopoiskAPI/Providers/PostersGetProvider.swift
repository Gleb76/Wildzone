//
//  PostersGetProvider.swift
//
//
//  Created by Назар Ткаченко on 10.08.2024.
//

import Foundation

public struct PostersGetProvider {
    private let repository: KinopoiskRepository

    public init(repository: KinopoiskRepository) {
        self.repository = repository
    }
    
    public func getPosters(
        movieId: [String],
        type: [String],
        language: [String],
        height: [String],
        width: [String],
        updatedAt: [String],
        createdAt: [String],
        page: Int = 1,
        limit: Int = 10,
        complete: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void
    ) {
        repository.getPosters(
            movieId: movieId,
            type: type,
            language: language,
            height: height,
            width: width,
            updatedAt: updatedAt,
            createdAt: createdAt,
            page: page,
            limit: limit,
            completion: complete
        )
    }
}
