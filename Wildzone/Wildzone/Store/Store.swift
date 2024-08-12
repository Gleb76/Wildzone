//
//  Store.swift
//  Wildzone
//
//  Created by Глеб Клыга on 9.08.24.
//

import Foundation
import KinopoiskAPI

enum NetworkError: Error {
    case noData
    case requestFailed
    case decodingError
}

typealias Dispatcher = (Action) -> Void
typealias Movie = DocModel
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

func moviesMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case let action as GetMoviesAction:
            Webservice().searchFilms(query: action.query) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movies):
                        dispatch(SetMoviesAction(movies: movies))
                    case .failure(let error):
                        print("Error fetching movies: \(error.localizedDescription)")
                    }
                }
            }
            
        case _ as GetGenresAction:
            Webservice().fetchGenres { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let genres):
                        dispatch(SetGenresAction(genres: genres))
                    case .failure(let error):
                        print("Error fetching genres: \(error.localizedDescription)")
                    }
                }
            }
            
        default:
            break
        }
    }
}

protocol ReduxState { }

struct AppState: ReduxState {
    var moviesState = MoviesState()
}

struct MoviesState: ReduxState {
    var movies: [Movie] = [Movie]()
    var genres: [String] = []
}

protocol Action { }

struct GetMoviesAction: Action {
    let query: String
}

struct GetGenresAction: Action {}

struct SetGenresAction: Action {
    let genres: [String]
}

struct SetMoviesAction: Action {
    let movies: [Movie]
}

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
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}

