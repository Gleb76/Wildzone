//
//  Store.swift
//  Wildzone
//
//  Created by Глеб Клыга on 9.08.24.
//

import Foundation
import KinopoiskAPI

typealias Dispatcher = (Action) -> Void
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState { }

struct AppState: ReduxState {
    var moviesState = MoviesState()
}

struct MoviesState: ReduxState {
    var movies: [DocModel] = []
    var isLoading: Bool = false
    var error: Error?
}

struct FetchMoviesRequest: Action {}

struct FetchMoviesSuccess: Action {
    let movies: [DocModel]
}

struct FetchMoviesFailure: Action {
    let error: Error
}

protocol Action { }

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        // Применение middleware перед редьюсером
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
        
        // Обновление состояния через редьюсер
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
    }
}
