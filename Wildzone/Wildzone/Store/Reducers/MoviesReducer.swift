//
//  MoviesReducer.swift
//  Wildzone
//
//  Created by Глеб Клыга on 9.08.24.
//

import Foundation
import KinopoiskAPI

func moviesReducer(state: MoviesState, action: Action) -> MoviesState {
    var state = state
    
    switch action {
        case let action as SetMoviesAction:
            state.movies = action.movies
        case let action as SetGenresAction:
            state.genres = action.genres
        default:
            break
    }
    
    return state
}

func filmDetailReducer(state: SimpleDocModel?, action: Action) -> SimpleDocModel? {
    var state = state
    
    switch action {
    case let action as SetFilmDetailAction:
        state = action.film
    default:
        break
    }
    
    return state
}
