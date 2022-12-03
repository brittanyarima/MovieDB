//
//  MovieItemView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/22/22.
//

import SwiftUI

struct MovieItemView: View {
    let movie: Movie
    
    var body: some View {
            ImageView(movie: movie, size: 125)
            .padding(.horizontal, 5)
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(movie: Movie.dummyData[0])
            .previewLayout(.sizeThatFits)
    }
}
