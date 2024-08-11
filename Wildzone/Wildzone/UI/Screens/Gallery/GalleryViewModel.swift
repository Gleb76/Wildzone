//
//  GalleryViewModel.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import Combine

class GalleryViewModel: ObservableObject {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    @Published var movieImages: MovieImagesResponse? = nil
    @Published var isLoaded = false
    
    private let movieService = MoviesNetworkingService()
    
    func fetchMovieImages() {
        Task {
            do {
                movieImages = try await movieService.fetchData(api: APIConstructor(endpoint: .movieImages(movie.id))).decode()
                isLoaded = true
            } catch {
                MErrorHandler.process(error)
            }
        }
    }
}
