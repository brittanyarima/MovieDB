//
//  ImageView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/22/22.
//

import SwiftUI

struct ImageView: View {
    let movie: Movie
    let size: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath)")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxHeight: 300)
            } placeholder: {
                ProgressView()
            }
        }
        .frame(maxHeight: 300)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(movie: Movie.dummyData.first!, size: 150)
            .previewLayout(.sizeThatFits)
    }
}
