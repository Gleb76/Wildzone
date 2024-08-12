//
//  SearchBar.swift
//
//
//  Created by Назар Ткаченко on 12.08.2024.
//

import SwiftUI

public struct SearchBar: View {
    
    public init() {}
    
    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Wtat's the movie?")
                    .font(.caption2)
                    .fontWeight(.semibold)
                
                Text("Any Film - Any Ganre")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
//        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
//        .padding()
    }
}
