//
//  MovieTitleView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/23/22.
//

import SwiftUI

struct MovieTitleView: View {
    let movie: Movie
    let color: Color
    let isShowingRating: Bool

    var formattedDate: String {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.dateFormat = "yyyy-MM-dd"
        let dt = fmt.date(from: movie.releaseDate )!
        fmt.dateFormat = "MMM d, yyyy"
        return fmt.string(from: dt)
    }

    var body: some View {
        HStack {
            ImageView(movie: movie, size: 100)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 8,
                    x: 0,
                    y: 0)

            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title )
                    .multilineTextAlignment(.leading)
                    .font(.title2.bold())
                    .foregroundColor(color)

                Text(formattedDate)
                    .foregroundColor(color.opacity(0.85))
                    .font(.subheadline)
                
                if isShowingRating {
                    RatingRowView(movie: movie)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct MovieTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTitleView(movie: Movie.dummyData.first!, color: .white, isShowingRating: true)
            .preferredColorScheme(.dark)
    }
}
