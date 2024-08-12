//
//  MoviesViewModel.swift
//  Wildzone
//
//  Created by Глеб Клыга on 12.08.24.
//

import Foundation
import KinopoiskAPI

class MoviesViewModel: ObservableObject {
    @Published var state: MoviesState

    private var store: Store<AppState>
    
    init(store: Store<AppState>) {
        self.store = store
        self.state = store.state.moviesState
        self.store.$state.map(\.moviesState).assign(to: &$state)
    }

    func dispatch(_ action: Action) {
        store.dispatch(action: action)
    }
}
