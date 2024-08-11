//
//  MovieTitleView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct MTitleView: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .tracking(1.25)
            .poppins(.bold, 20)
            .hAlign(.leading)
            .padding(.top, 15)
    }
}

#Preview {
    MTitleView("Trending")
}
