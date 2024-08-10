//
//  Middleware.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import Foundation
import KinopoiskAPI

func loggingMiddleware<State: ReduxState>(state: State, action: Action, next: @escaping Dispatcher) {
    print("Action: \(action)")
    next(action)
}
