//
//  HomeView.swift
//  Wildzone
//
//  Created by Глеб Клыга on 11.08.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    if let movie = viewModel.topMovie {
                        NavigationLink(value: movie) {
                            TopMovieView(movie: viewModel.topMovie)
                        }
                    }
                    
                    top10Section
                    
                    previewsSection
                    
                    continueWatchingSection
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .ignoresSafeArea(edges: .top)
            .navigationDestination(for: Movie.self) { movie in
                DetailView(movie: movie)
            }
        }
        .background(.black)
        .environment(\.colorScheme, .dark)
        .task {
            await viewModel.fetchTrending()
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}

private extension HomeView {
    var previewsSection: some View {
        VStack(spacing: 4) {
            MTitleView("Your Next Watch")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(viewModel.trendingMovies.shuffled()) { movie in
                        NavigationLink(value: movie) {
                            PreviewCardView(movie: movie)
                        }
                    }
                }
            }
        }
        .padding()
        .redacted(reason: viewModel.isLoadingTrendingMovies ? .placeholder : [])
    }
    
    var continueWatchingSection: some View {
        VStack(spacing: 4) {
            MTitleView("Continue Watching for Gleb")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(viewModel.trendingMovies.shuffled()) { movie in
                        NavigationLink(value: movie) {
                            ContinueWatchingCardView(movie: movie)
                        }
                    }
                }
            }
        }
        .padding()
        .redacted(reason: viewModel.isLoadingTrendingMovies ? .placeholder : [])
    }
    
    var top10Section: some View {
        VStack(spacing: 4) {
            MTitleView("Top 10 Movies in Russia Today")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(0..<(viewModel.trendingMovies.count > 10 ? 10 : viewModel.trendingMovies.count), id: \.self) { index in
                        NavigationLink(value: viewModel.trendingMovies[index]) {
                            Top10CardView(count: index + 1, movie: viewModel.trendingMovies[index])
                        }
                    }
                }
            }
        }
        .padding()
        .redacted(reason: viewModel.isLoadingTrendingMovies ? .placeholder : [])
    }
}
