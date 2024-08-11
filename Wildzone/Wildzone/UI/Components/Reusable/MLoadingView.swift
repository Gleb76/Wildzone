//
//  MLoadingView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct MLoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(Color.primary)
            .frame(height: 25)
    }
}
