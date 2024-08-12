//
//  FilmViewModel.swift
//  Wildzone
//
//  Created by Илья Десятов on 12.08.2024.
//

import Foundation

class FilmDetailViewModel: ObservableObject {
    @Published var film: SimpleDocModel?
    
    private var store: Store<AppState>
    
    init(store: Store<AppState>) {
        self.store = store
        self.film = store.state.filmDetailState
        store.$state.map(\.filmDetailState).assign(to: &$film)
    }
}

