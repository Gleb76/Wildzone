//
//  ReviewCard.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: review.authorImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack {
                        Color.placeholder
                        
                        if let firstChar = review.authorName.first {
                            Text(String(firstChar))
                        }
                    }
                }
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                
                Text(review.authorName)
                    .poppins(.bold, 16)
            }
            
            Text(review.content.trim())
                .poppins(.light)
            
            Divider()
        }
    }
}


#Preview {
    ReviewCard(review: dev.review)
}

