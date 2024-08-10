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
    
    @State private var networkProvider: MoviesSearchProvider = .init()
    @State private var films: [DocModel] = .init([])
    @State private var text: String = .init("")
    
    var body: some View {
        ZStack {
            Color.wbBG.ignoresSafeArea()
            VStack {
                SearchBarView(searchText: $text)
                    .frame(height: 50)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                    .background(.wbBG)
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, World!")
                
                if !films.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(films, id: \.id) { film in
                                if let logoURL = film.poster?.url {
                                    RemoteImage(url: logoURL).frame(width: 130)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 220)
                }
            }
            .onAppear {
                networkProvider.searchFilms(query: "") { data, error in
                    print(data?.docs?.forEach({ film in
                        film.poster?.url
                    }))
                    films.append(contentsOf: data?.docs ?? [])
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}


