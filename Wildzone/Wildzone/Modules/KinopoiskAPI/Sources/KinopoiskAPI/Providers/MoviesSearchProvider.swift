//
//  MoviesSearchProvider.swift
//
//
//  Created by Назар Ткаченко on 10.08.2024.
//

import Foundation

public struct MoviesSearchProvider {
    private let repository: KinopoiskRepository

    public init(repository: KinopoiskRepository) {
        self.repository = repository
    }
    
    public func searchFilms(query: String, page: Int = 1, limit: Int = 10, complete: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void) {
        repository.searchFilms(query: query, page: page, limit: limit, completion: complete)
    }
}
