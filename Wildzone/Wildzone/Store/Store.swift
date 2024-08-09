//
//  Store.swift
//  Wildzone
//
//  Created by Глеб Клыга on 9.08.24.
//

import Foundation

typealias Dispatcher = (Action) -> Void

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol ReduxState { }

struct AppState: ReduxState {
    // var movies = MoviesState()
}

// Пример с фильмами
// struct MoviesState: ReduxState {
//     var movies = [Movie]()
// }

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
