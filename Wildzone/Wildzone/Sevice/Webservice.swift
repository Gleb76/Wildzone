//
//  webService.swift
//  Wildzone
//
//  Created by Глеб Клыга on 12.08.24.
//

import Foundation
import KinopoiskAPI


class Webservice {
    
    private let moviesSearchProvider = MoviesSearchProvider(repository: KinopoiskRepositoryImpl())
    private let kinopoiskValuesProvider = KinopoiskValuesProvider(repository: KinopoiskRepositoryImpl())
    
    func searchFilms(query: String, completion: @escaping (Result<[DocModel], Error>) -> Void) {
        moviesSearchProvider.searchFilms(query: query) { data, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data.docs ?? []))
        }
    }
    
    func fetchGenres(completion: @escaping (Result<[String], Error>) -> Void) {
        kinopoiskValuesProvider.loadPossibleValues(field: "genres.name") { data, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            let genres = data.compactMap { $0.name }
            completion(.success(genres))
        }
    }
}
