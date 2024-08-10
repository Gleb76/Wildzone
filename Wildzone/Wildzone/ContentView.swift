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

import KinopoiskAPI

struct ContentView: View {
    
    @State var networkProvider: KinopoiskValuesProvider = .init()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, World!")
        }
        .onAppear {
            networkProvider.loadPossibleValues(field: "genres.name") { data, error in
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


