//
//  WildzoneApp.swift
//  Wildzone
//
//  Created by Глеб Клыга on 8.08.24.
//

import SwiftUI

@main
struct WildzoneApp: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer, state: AppState())
        WindowGroup {
            ContentView()
        }
    }
}
