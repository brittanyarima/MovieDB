//
//  NowPlayingView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 7/2/22.
//

import SwiftUI

struct NowPlayingView: View {
    @StateObject var viewModel = NowPlayingViewModel()
    
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

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
