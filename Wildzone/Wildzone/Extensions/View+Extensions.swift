//
//  View+Extensions.swift
//  Wildzone
//
//  Created by Глеб Клыга on 9.08.24.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView()-> some View {
        NavigationView { self }
    }
}
