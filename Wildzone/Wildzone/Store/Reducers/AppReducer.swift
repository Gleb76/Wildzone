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
    
    state.moviesState = moviesReducer(state.moviesState, action)

    return state
}

