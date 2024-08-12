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
    @State private var networkProvider: MoviesSearchProvider = MoviesSearchProvider(repository: KinopoiskRepositoryImpl())
    @State private var fetchGenres: KinopoiskValuesProvider = KinopoiskValuesProvider(repository: KinopoiskRepositoryImpl())
    
    @State private var showFilmDetail = false
    @State private var selectedFilm: DocModel?
    @State private var text: String = .init("")
    @State private var genres: [String] = []
    @State private var genresDict: [String: [Int]] = [:]
    @State private var films: [DocModel] = .init([])
    @State private var selectedGenre: String?
    
    private var proxy: ScrollViewProxy?
    
    
    private let columns = [
        GridItem(.flexible(), spacing: 10)
    ]
    
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
            fetchData()
            groupFilmsByGenre()
        }
    }
}

//MARK: - Private PropertyViews
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
                                    searchFilms(query: value)
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
                            if let film = films.first(where: { $0.id == id }) {
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
            if !films.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: columns, spacing: 10) {
                        ForEach(films, id: \.id) { film in
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
            colors: [Color.tDBackground1,Color.tDBackground2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

//MARK: - Private Methods
private extension FilmList {
    
    func fetchData() {
        networkProvider.searchFilms(query: "") { data, error in
            if let data = data {
                films.append(contentsOf: data.docs ?? [])
                groupFilmsByGenre()
            }
        }
        
        fetchGenres.loadPossibleValues(field: "genres.name") { data, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let names = data.compactMap { $0.name }
            genres.append(contentsOf: names)
        }
    }
    
    func groupFilmsByGenre() {
        var dict: [String: [Int]] = [:]
        
        for film in films {
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
    
    func searchFilms(query: String) {
        films.removeAll()
        networkProvider.searchFilms(query: query) { data, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.films.append(contentsOf: data.docs ?? [])
                    groupFilmsByGenre()
                }
            }
        }
    }
}
