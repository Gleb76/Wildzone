//
//   PreviewCardView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct PreviewCardView: View {
    let movie: Movie

    var itemWidth: CGFloat {
        UIScreen.main.bounds.width / 4
    }
    
    var body: some View {
        MImageView(movie: movie)
            .frame(width: itemWidth, height: itemWidth)
            .cornerRadius(0)
            .clipShape(Circle())
    }
}

#Preview {
    PreviewCardView(movie: dev.movie)
} 
