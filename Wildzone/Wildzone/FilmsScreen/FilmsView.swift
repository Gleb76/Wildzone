//
//  FilmsView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct FilmsScrollView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            // SearchBar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search films...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 10)
            }
            .padding(.horizontal)
            .padding(.top)
            
            // Categories
            if searchText.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(1..<7) { index in
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.orange)
                                Text("Category \(index)")
                                    .font(.caption)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        Button(action: {}) {
                            Text("Action")
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        Button(action: {}) {
                            Text("Drama")
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(20)
                        }
                        Button(action: {}) {
                            Text("Comedy")
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(20)
                        }
                        Button(action: {}) {
                            Text("Thriller")
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            List {
                FilmViewDetail(imageName: "film1", title: "Film Title 1", description: "Short description of the film", rating: "The best Film")
                FilmViewDetail(imageName: "film2", title: "Film Title 2", description: "Short description of the film", rating: "$The")
                FilmViewDetail(imageName: "film3", title: "Film Title 3", description: "Short description of the film", rating: "$The")
            }
            .listStyle(PlainListStyle())
            
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "film")
                    Text("Films")
                }
                Spacer()
                VStack {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                Spacer()
            }
            .padding()
            .background(Color.white.shadow(radius: 2))
        }
        .background(Color.white)
    }
}

#Preview {
    FilmsScrollView()
}

