//
//  ContentView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 8.08.24.
//

import SwiftUI
import KinopoiskAPI
import WildZoneUISystem

struct ContentView: View {
    @State private var networkProvider: MoviesSearchProvider = MoviesSearchProvider(repository: KinopoiskRepositoryImpl())
    @State private var fetchGenres: KinopoiskValuesProvider = KinopoiskValuesProvider(repository: KinopoiskRepositoryImpl())
    
    
    @State private var text: String = .init("")
    @State private var genres: [String] = []
    @State private var genresDict: [String: [Int]] = [:]

    @State private var films: [DocModel] = .init([])
    @State private var selectedGenre: String?
    
    private var proxy: ScrollViewProxy?
    
    
    let columns = [
        GridItem(.flexible(), spacing: 10)
    ]
    
    private var searchDebouncer = SearchDebouncer()
    
    var body: some View {
        ZStack {
            Color.wbBG.ignoresSafeArea()
            VStack {
                SearchBarView(searchText: $text)
                    .frame(height: 50)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                    .background(.wbBG)
                    .onChange(of: text, perform: { value in
                                            searchDebouncer.debounce(interval: 1.0) {
                                                searchFilms(query: value)
                                            }
                                        })
                
                postersHGrid
                
                
                VStack {
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
                        .padding()
                    }
                    
                    
                    
                    ScrollViewReader { proxy in
                        List {
                            ForEach(genresDict.keys.sorted(), id: \.self) { genre in
                                Section(header: Text(genre)) {
                                    ForEach(genresDict[genre]!, id: \.self) { id in
                                        if let film = films.first(where: { $0.id == id }) {
                                            FilmCell(film: film)
                                        }
                                    }
                                }
                            }
                        }
                        .onChange(of: selectedGenre) { genre in
                            if let genre = genre {
                                withAnimation {
                                    proxy.scrollTo(genre, anchor: .top)
                                }
                            }
                        }
                    }
                }
                
                

            }
            .onAppear {
                fetchData()
                groupFilmsByGenre()
            }
            .padding()
        }
    }
    
    private var postersHGrid: some View {
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
                    .padding(.horizontal)
                }
                .frame(height: 220)
            }
        }
    }
    
    private var gradientView: some View {
        LinearGradient(
            colors: [Color.tDBackground1,Color.tDBackground2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    private func fetchData() {
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

    
    private func groupFilmsByGenre() {
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
    
    private func searchFilms(query: String) {
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

#Preview {
    ContentView()
}

final class SearchDebouncer {
    private var currentWorkItem: DispatchWorkItem?
    
    func debounce(interval: TimeInterval, block: @escaping () -> Void) {
        // Отменить предыдущую задачу
        currentWorkItem?.cancel()
        
        // Создать новую задачу
        currentWorkItem = DispatchWorkItem(block: block)
        
        // Разместить новую задачу после указанного интервала
        if let workItem = currentWorkItem {
            DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: workItem)
        }
    }
}
