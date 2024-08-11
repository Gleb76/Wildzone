//
//  ContinueWatchingCardView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct ContinueWatchingCardView: View {
    let movie: Movie

    var itemWidth: CGFloat {
        UIScreen.main.bounds.width / 3
    }
    
    var itemHeight: CGFloat {
        UIScreen.main.bounds.height * 0.2
    }
    
    var body: some View {
        MImageView(movie: movie)
            .frame(width: itemWidth, height: itemHeight)
            .overlay {
                Color.black.opacity(0.25)
            }
            .overlay(alignment: .center) {
                Image(systemName: "play.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .overlay(alignment: .bottom) {
                Text("S1:E4")
                    .poppins(.bold, 14)
                    .padding(2.5)
                    .background(Color.black.opacity(0.75))
            }
    }
}

#Preview {
    ContinueWatchingCardView(movie: dev.movie)
}
