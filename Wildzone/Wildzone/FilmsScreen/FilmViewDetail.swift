//
//  FilmViewDetail.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct FilmViewDetail: View {
    var imageName: String
    var title: String
    var description: String
    var price: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 150)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(price)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
            .padding(.leading, 5)
        }
        .padding(.vertical, 10)
    }
}

