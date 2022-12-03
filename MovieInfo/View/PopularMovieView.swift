//
//  MovieListView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/22/22.
//

import SwiftUI

struct PopularMovieView: View {
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.fetchedMovies, id: \.id) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieItemView(movie: movie)
                    }
                }
            }
            .frame(maxHeight: 300)
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieView()
            .previewLayout(.sizeThatFits)
    }
}
