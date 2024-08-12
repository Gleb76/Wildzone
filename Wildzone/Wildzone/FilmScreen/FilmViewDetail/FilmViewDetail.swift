//
//  FilmViewDetail.swift
//  Wildzone
//
//  Created by Назар Ткаченко on 12.08.2024.
//

import Foundation
import SwiftUI

struct SimpleDocModel {
    var name: String?
    var posterUrl: String?
    var rating: Double?
    var description: String?
}


struct FilmDetailView: View {
    var film: SimpleDocModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let posterUrlString = film.posterUrl,
                   let posterUrl = URL(string: posterUrlString) {
                    // Используем AsyncImage для загрузки изображения по URL
                    AsyncImage(url: posterUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 200, height: 300)
                        case .success(let image):
                            image.resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 300)
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                }

                // Название фильма
                if let name = film.name {
                    Text(name)
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                }

                // Описание фильма
                if let description = film.description {
                    Text(description)
                        .font(.body)
                        .padding(.horizontal)
                }

                // Рейтинг фильма
                if let rating = film.rating {
                    Text("IMDB: \(rating, specifier: "%.1f")")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
            }
            .padding()
        }
        .navigationTitle("Фильм")
    }
}
