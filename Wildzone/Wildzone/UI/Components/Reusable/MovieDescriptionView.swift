//
//  MovieDescriptionView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct MovieDescriptionView: View {
    let movieDetails: MovieDetails
    
    var body: some View {
        VStack {
            Text(movieDetails.tagline)
                .poppins(.bold, 16)
            
            Text(movieDetails.overview)
                .poppins(.medium, 14)
                .padding(.top)
        }
        .foregroundStyle(Color.black)
        .multilineTextAlignment(.center)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)
        )
        .padding(15)
    }
}
