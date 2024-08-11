//
//  HomeViewModel.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var trendingMovies: [Movie] = []
    @Published var topMovie: Movie? = nil
    @Published var error: Error?
    @Published var isLoadingTrendingMovies = false
    
    private let movieService = MoviesNetworkingService()
    
    func fetchTrending() async {
        isLoadingTrendingMovies = true
        do {
            let response: MovieApiResponse = try await movieService.fetchData(api: APIConstructor(endpoint: .trending)).decode()
            topMovie = response.results.randomElement()
            trendingMovies = response.results
            isLoadingTrendingMovies = false
        } catch {
            self.error = error
            isLoadingTrendingMovies = false
        }
    }
}
