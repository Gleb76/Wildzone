//
//  File.swift
//  
//
//  Created by Глеб Клыга on 11.08.24.
//

import Foundation

public protocol KinopoiskRepository {
    func getPossibleValues(field: String, completion: @escaping (_ data: [PossibleValueModel]?, _ error: Error?) -> Void)
    func searchFilms(query: String, page: Int, limit: Int, completion: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void)
    func getPosters(movieId: [String], type: [String], language: [String], height: [String], width: [String], updatedAt: [String], createdAt: [String], page: Int, limit: Int, completion: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void)
}

class KinopoiskRepositoryImpl: KinopoiskRepository {
    func getPossibleValues(field: String, completion: @escaping (_ data: [PossibleValueModel]?, _ error: Error?) -> Void) {
        KinopoiskAPI.getPossibleValuesByField(field: field, completion: completion)
    }

    func searchFilms(query: String, page: Int = 1, limit: Int = 10, completion: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void) {
        KinopoiskAPI.searchFilmsGet(query: query, page: page, limit: limit, completion: completion)
    }

    func getPosters(movieId: [String], type: [String], language: [String], height: [String], width: [String], updatedAt: [String], createdAt: [String], page: Int = 1, limit: Int = 10, completion: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void) {
        KinopoiskAPI.postersGet(movieId: movieId, type: type, language: language, height: height, width: width, updatedAt: updatedAt, createdAt: createdAt, page: page, limit: limit, completion: completion)
    }
}
