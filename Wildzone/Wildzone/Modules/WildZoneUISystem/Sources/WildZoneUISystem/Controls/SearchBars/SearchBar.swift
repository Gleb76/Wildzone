//
//  SearchBar.swift
//
//
//  Created by Илья Десятов on 12.08.2024.
//

import SwiftUI

public struct SearchBar: View {
    @Binding var searchText: String
    
    public init(searchText: Binding<String>) {
        self._searchText = searchText
    }
    
    public var body: some View {
        HStack {
            magnifyingGlassIcon
            searchTextField
            Spacer()
            filterButton
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundColor(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        )
        .padding()
    }
    
    private var magnifyingGlassIcon: some View {
        Image(systemName: "magnifyingglass")
    }
    
    private var searchTextField: some View {
        TextField("What's the movie?", text: $searchText)
            .font(.caption2)
            .foregroundColor(.black)
            .textFieldStyle(PlainTextFieldStyle())
    }
    
    private var filterButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .foregroundColor(.black)
        }
    }
}
