//
//  AppReducer.swift
//  Wildzone
//
//  Created by Глеб Клыга on 9.08.24.
//

import Foundation
import KinopoiskAPI

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.moviesState = moviesReducer(state: state.moviesState, action: action)
    state.filmDetailState = filmDetailReducer(state: state.filmDetailState, action: action)
    return state
}

