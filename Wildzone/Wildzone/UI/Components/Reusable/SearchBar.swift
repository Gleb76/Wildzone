//
//  SearchBar.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchedText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchedText.isEmpty ? Color.searchBox : .white)
            
            TextField("Search", text: $searchedText)
                .foregroundColor(.white)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .font(.headline)
                        .opacity(searchedText.isEmpty ? 0.0 : 1.0)
                        .foregroundColor(.white)
                        .onTapGesture {
                            searchedText = ""
                            UIApplication.shared.endEditing()
                        }
                    , alignment: .trailing
                )
        }
        .poppins(.light, 16)
        .foregroundColor(Color.searchBox)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.appBackground)
                .shadow(
                    color: Color.searchBox.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 0
                )
        )
        .padding()
    }
}

#Preview {
    VStack {
        SearchBar(searchedText: .constant(""))
        
        Spacer()
    }
    .padding()
    .background(Color.appBackground)
}
