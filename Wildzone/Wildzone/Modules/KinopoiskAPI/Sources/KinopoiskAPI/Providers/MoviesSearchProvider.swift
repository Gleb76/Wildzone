//
//  MoviesSearchProvider.swift
//
//
//  Created by Назар Ткаченко on 10.08.2024.
//

import Foundation

public struct MoviesSearchProvider {
        
    public init() {}
    
    mutating public func searchFilms(query: String, complete: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void) {
        KinopoiskAPI.searchFilmsGet(query: query){ data, error in
            complete(data, error)
        }
    }
}
