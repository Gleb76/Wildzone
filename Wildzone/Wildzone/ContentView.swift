//
//  ContentView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 8.08.24.
//

import SwiftUI
import KinopoiskAPI

//struct NetworkWorker {
//    
//    var possibleValues: [MovieResponseModel] = []
//    
//    init() {}
//    
//    mutating func searchFilms(complete: @escaping (_ data: MovieResponseModel?, _ error: Error?) -> Void) {
//        //        CharacterAPI.characterGet { data, error in
//        //            complete(data, error)
////        KinopoiskAPI.titleGet(query: "А") { data, error in
////            complete(data, error)
////        }
////        KinopoiskAPI.searchFilmsGet(query: "1"){ data, error in
////            complete(data, error)
////        }
//        KinopoiskAPI.getPossibleValuesByField(field: "") { data, error in
//            complete(data, error)
//        }
//    }
//}


//extension TitleGet200Response: Identifiable {
//    public var id: String {
//        guard let urlString = url else {
//            fatalError("url should never be nil")
//        }
//        return urlString
//    }
//}

import SwiftUI
import KinopoiskAPI

struct ContentView: View {
    
    @State var networkProvider: MoviesSearchProvider = .init()
    @State var films: [DocModel] = []
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, World!")
            
            if !films.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(films, id: \.id) { film in
                            if let logoURL = film.poster?.url {
                                AsyncImage(url: URL(string: logoURL)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 150, height: 200)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 220) // Задаем высоту ScrollView
            }
        }
        .onAppear {
            networkProvider.searchFilms(query: "") { data, error in
                print(data?.docs?.forEach({ film in
                    film.poster?.url
                }))
                films.append(contentsOf: data?.docs ?? [])
            }
//            networkProvider.loadPossibleValues(field: "genres.name") { data, error in
//                print("============Data============")
//                print(data)
//                print("============Errors============")
//                print(error)
//            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


