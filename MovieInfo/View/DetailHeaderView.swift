//
//  DetailHeaderView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/23/22.
//

import SwiftUI

struct DetailHeaderView: View {
    let movie: Movie
    
    let gradient = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: .gray, location: 0),
            .init(color: .clear, location: 0.4)
        ]),
        startPoint: .bottom,
        endPoint: .top
    )
    
    var body: some View {
        AsyncImage(
            url: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .clipped()
                    .overlay {
                        ZStack(alignment: .bottom) {
                            AsyncImage(
                                url: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath)")) { image in
                                    image
                                        .resizable()
                                        .blur(radius: 20)
                                        .padding(-20)
                                        .clipped()
                                        .mask(gradient)

                                    gradient

                                    MovieTitleView(movie: movie, color: .white, isShowingRating: true)
                                        .position(x: UIScreen.main.bounds.height / 4, y: UIScreen.main.bounds.width - 55)
                                } placeholder: {
                                    ProgressView()
                                }
                        }
                    }
            } placeholder: {
                ProgressView()
            }
    }
}

struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView(movie: Movie.dummyData.first!)
    }
}
