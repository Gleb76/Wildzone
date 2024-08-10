//
//  MoviesReducer.swift
//  Wildzone
//
//  Created by Глеб Клыга on 9.08.24.
//

import Foundation
import KinopoiskAPI

func moviesReducer(_ state: MoviesState, _ action: Action) -> MoviesState {
    var state = state
    
    switch action {
    case let action as FetchMoviesRequest:
        state.isLoading = true
        state.error = nil
        
    case let action as FetchMoviesSuccess:
        state.isLoading = false
        state.movies = action.movies
        
    case let action as FetchMoviesFailure:
        state.isLoading = false
        state.error = action.error
        
    default:
        break
    }

    return state
}

// тут пример парсинга (Дорабатываем через поиск)

extension KinopoiskAPI {
    // Пример метода поиска фильмов
//        static func fetchMovies(dispatch: @escaping Dispatcher, query: String) {
//            dispatch(FetchMoviesRequest())
//            
//            searchFilmsGet(query: query) { data, error in
//                if let data = data?.docs {
//                    dispatch(FetchMoviesSuccess(movies: data))
//                } else if let error = error {
//                    dispatch(FetchMoviesFailure(error: error))
//                }
//            }
//        }
}
