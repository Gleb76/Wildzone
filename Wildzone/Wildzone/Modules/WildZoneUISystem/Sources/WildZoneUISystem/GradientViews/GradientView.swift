//
//  GradientView.swift
//
//
//  Created by Назар Ткаченко on 12.08.2024.
//

import SwiftUI

public struct GradientView: View {
    public init() {}
    
    public var body: some View {
        LinearGradient(
            colors: [Color.tDBackground1,Color.tDBackground2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

