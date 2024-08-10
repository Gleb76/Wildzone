//
//  ContentView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 8.08.24.
//

import SwiftUI
import KinopoiskAPI

struct NetworkWorker {
    
    var films: [MovieResponse] = []
    
    init() {}
    
    mutating func loadCharacters(complete: @escaping (_ data: MovieResponse?, _ error: Error?) -> Void) {
        //        CharacterAPI.characterGet { data, error in
        //            complete(data, error)
//        KinopoiskAPI.titleGet(query: "А") { data, error in
//            complete(data, error)
//        }
        KinopoiskAPI.postersGet { data, error in
            complete(data, error)
        }
    }
}


//extension TitleGet200Response: Identifiable {
//    public var id: String {
//        guard let urlString = url else {
//            fatalError("url should never be nil")
//        }
//        return urlString
//    }
//}

struct ContentView: View {
    
    @State var films: NetworkWorker = .init()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
            films.loadCharacters { data, error in
                print("============Data============")
                print(data)
                print("============Errors============")
                print(error)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


