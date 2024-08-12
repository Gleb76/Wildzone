//
//  File.swift
//
//
//  Created by Назар Ткаченко on 11.08.2024.
//

import SwiftUI

public struct RemoteImage: View {
    @ObservedObject public var imageLoader: ImageLoader
    
    public init(url: String) {
        self.imageLoader = ImageLoader(url: url)
    }
    
    public var body: some View {
        Group {
            switch imageLoader.image {
            case .none:
                ProgressView()
            case .some(let image):
                Image(uiImage: image)
                    .resizable()
            }
        }
    }
}

