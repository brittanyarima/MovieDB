//
//  TrendingMovieView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 7/2/22.
//

import SwiftUI

struct TrendingMovieView: View {
    let movie: Movie

    
    var body: some View {
      
        Text(movie.title)
        
    }
    
    
}

struct TrendingMovieView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingMovieView(movie: Movie.dummyData.first!)
    }
}
