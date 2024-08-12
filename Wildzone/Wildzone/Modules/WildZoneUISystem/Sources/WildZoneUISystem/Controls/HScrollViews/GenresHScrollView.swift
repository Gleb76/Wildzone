//
//  GenresHScrollView.swift
//
//
//  Created by Назар Ткаченко on 12.08.2024.
//

import SwiftUI

public struct GenresHScrollView: View {
    @Binding var genresModel: [String]
    @Binding var selectedGenre: String?
    
    public init(genresModel: Binding<[String]>, selectedGenre: Binding<String?>) {
        self._genresModel = genresModel
        self._selectedGenre = selectedGenre
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(genresModel, id: \.self) { genre in
                    Button(action: {
                        withAnimation {
                            selectedGenre = genre
                        }
                    }) {
                        Text(genre)
                            .padding()
                            .background(selectedGenre == genre ? Color.wbDefaultPurple : Color.clear)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .background(GradientView())
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.wbText, lineWidth: 2)
                            )
                    }
                }
            }
        }
    }
}
