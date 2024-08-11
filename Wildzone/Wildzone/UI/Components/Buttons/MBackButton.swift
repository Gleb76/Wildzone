//
//  MBackButton.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct MBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color.primary.opacity(0.25))
                            .cornerRadius(10)
                            .shadow(color: .primary, radius: 5)
                    }
                }
            }
    }
}
