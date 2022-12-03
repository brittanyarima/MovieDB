//
//  RatingRowView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/30/22.
//

import SwiftUI

struct RatingRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            RatingView(movie: movie)
            Text(movie.voteCount.roundedWithAbbreviations )
                .font(.caption)
                .foregroundColor(.yellow)
        }
    }
}

struct RatingRowView_Previews: PreviewProvider {
    static var previews: some View {
        RatingRowView(movie: Movie.dummyData.first!)
    }
}
