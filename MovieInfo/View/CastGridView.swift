//
//  CastGridView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/29/22.

import SwiftUI

struct CastGridView: View {
    @StateObject var viewModel = CastViewModel()
    let movie: Movie
    
    var rows = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 20) {
                if viewModel.fetchedCast.count > 10 {
                    ForEach(viewModel.fetchedCast.prefix(upTo: 10), id: \.id) { person in
                        CastRowView(movie: movie, cast: person)
                    }
                }
            }
            .padding(2)
        }
        .task {
            await viewModel.fetchCast(movieId: movie.id)
        }
    }
}

struct CastGridView_Previews: PreviewProvider {
    static var previews: some View {
        CastGridView(movie: Movie.dummyData.first!)
        
    }
}
