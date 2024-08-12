//
//  ContentView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 8.08.24.
//

import SwiftUI
import KinopoiskAPI
import WildZoneUISystem

struct FilmList: View {
    
    @EnvironmentObject private var store: Store<AppState>
    
    @State private var showFilmDetail = false
    @State private var selectedFilm: DocModel?
    @State private var text: String = .init("")
    @State private var genres: [String] = []
    @State private var genresDict: [String: [Int]] = [:]
    @State private var selectedGenre: String?
    
    private var proxy: ScrollViewProxy?
    private let columns = [GridItem(.flexible(), spacing: 10)]
    private var searchDebouncer = SearchDebouncer()
    
    var body: some View {
        NavigationView {
            VStack {
                filmsList
            }
        }
        .sheet(isPresented: $showFilmDetail) {
            if let film = selectedFilm {
                FilmDetailView(film: SimpleDocModel(name: film.name, posterUrl: film.poster?.url, rating: film.rating?.imdb, description: film.description))
            }
        }
        .onAppear {
            fetchGenres()
            store.dispatch(action: GetMoviesAction(query: ""))
        }
        .onChange(of: store.state.moviesState.movies) { _ in
            groupFilmsByGenre()
        }
        .onChange(of: store.state.moviesState.genres) { _ in
            genres = store.state.moviesState.genres
        }
    }
}

// MARK: - Private PropertyViews
private extension FilmList {
    
    var filmsList: some View {
        ScrollViewReader { proxy in
            List {
                Section {
                    VStack {
                        SearchBarView(searchText: $text)
                            .frame(height: 50)
                            .padding(.top, 16)
                            .padding(.horizontal, 24)
                            .background(.clear)
                            .onChange(of: text, perform: { value in
                                searchDebouncer.debounce(interval: 1.0) {
                                    store.dispatch(action: GetMoviesAction(query: value))
                                }
                            })
                        postersHGrid
                        genresHScrollView
                    }
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
                ForEach(genresDict.keys.sorted(), id: \.self) { genre in
                    Section(header: Text(genre)) {
                        ForEach(genresDict[genre]!, id: \.self) { id in
                            if let film = store.state.moviesState.movies.first(where: { $0.id == id }) {
                                FilmCell(film: film)
                                    .onTapGesture {
                                        selectedFilm = film
                                        showFilmDetail = true
                                    }
                            }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .onChange(of: selectedGenre) { genre in
                if let genre = genre {
                    withAnimation {
                        proxy.scrollTo(genre, anchor: .top)
                    }
                }
            }
        }
        .listRowBackground(Color.clear)
    }
    
    var genresHScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(genres, id: \.self) { genre in
                    Button(action: {
                        withAnimation {
                            selectedGenre = genre
                        }
                    }) {
                        Text(genre)
                            .padding()
                            .background(selectedGenre == genre ? Color.wbDefaultPurple : Color.clear)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .background(gradientView)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.wbText, lineWidth: 2)
                            )
                    }
                }
            }
        }
    }
    
    var postersHGrid: some View {
        Group {
            if !store.state.moviesState.movies.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: columns, spacing: 10) {
                        ForEach(store.state.moviesState.movies, id: \.id) { film in
                            if let logoURL = film.poster?.url {
                                RemoteImage(url: logoURL)
                                    .frame(width: 150)
                            }
                        }
                    }
                }
                .frame(height: 220)
            }
        }
    }
    
    var gradientView: some View {
        LinearGradient(
            colors: [Color.tDBackground1, Color.tDBackground2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

// MARK: - Private Methods
private extension FilmList {
    
    func fetchGenres() {
        store.dispatch(action: GetGenresAction())
    }
    
    private func groupFilmsByGenre() {
        var dict: [String: [Int]] = [:]
        
        for film in store.state.moviesState.movies {
            if let filmGenres = film.genres {
                for genre in filmGenres {
                    if let genreName = genre.name {
                        if var genreFilms = dict[genreName] {
                            genreFilms.append(film.id!)
                            dict[genreName] = genreFilms
                        } else {
                            dict[genreName] = [film.id!]
                        }
                    }
                }
            }
        }
        
        genresDict = dict
    }
}
