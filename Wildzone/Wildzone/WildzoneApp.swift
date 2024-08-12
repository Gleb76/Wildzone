//
//  WildzoneApp.swift
//  Wildzone
//
//  Created by Глеб Клыга on 8.08.24.
//

import SwiftUI

@main
struct WildzoneApp: App {
    @StateObject private var store = Store<AppState>(
        reducer: appReducer,
        state: AppState(),
        middlewares: [loggingMiddleware]
    )
    
    var body: some Scene {
        WindowGroup {
            FilmList()
                .background(.wbBG)
                .environmentObject(store)
        }
    }
}
