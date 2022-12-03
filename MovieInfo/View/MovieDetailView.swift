//
//  MovieDetailView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/22/22.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            DetailHeaderView(movie: movie)

            VStack(alignment: .leading, spacing: 10) {
                Text("Overview")
                    .font(.headline)

                Text(movie.overview )
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))

                Text("Top Cast")
                    .font(.headline)
                    .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            VStack {
                CastGridView(movie: movie)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.dummyData.first!)
            .preferredColorScheme(.light)
    }
}
