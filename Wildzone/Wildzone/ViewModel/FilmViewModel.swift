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
    
    func fetchFilmDetail(id: String) {
        // Ваш код для загрузки данных о фильме и вызова dispatch
        // Например:
        // Webservice().fetchFilmDetail(id: id) { result in
        //     switch result {
        //     case .success(let film):
        //         dispatch(SetFilmDetailAction(film: film))
        //     case .failure(let error):
        //         print("Error fetching film detail: \(error.localizedDescription)")
        //     }
        // }
    }
}

