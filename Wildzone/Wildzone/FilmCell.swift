//
//  FilmCell.swift
//  Wildzone
//
//  Created by Назар Ткаченко on 11.08.2024.
//

import SwiftUI
import KinopoiskAPI
import WildZoneUISystem

struct FilmCell: View {
    let film: DocModel

    var body: some View {
        HStack {
            if let logoURL = film.poster?.url {
                RemoteImage(url: logoURL)
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(film.name ?? "No title")
                    .font(.headline)
                    .lineLimit(1)
                Text(film.description ?? "No description")
                    .font(.subheadline)
                    .lineLimit(3)
            }
            .padding(.leading, 10)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
