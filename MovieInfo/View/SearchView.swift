//
//  SearchView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 7/3/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchResults, id: \.id) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieTitleView(movie: movie, color: .black, isShowingRating: false)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Search Movies")
            .onSubmit(of: .search) {
                Task {
                    await viewModel.fetchMovie(searchText: searchText)
                    searchText = ""
                }
            }
        }
        .accentColor(.yellow)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
