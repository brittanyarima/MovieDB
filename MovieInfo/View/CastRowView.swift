//
//  CastRowView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/25/22.
//

import SwiftUI

struct CastRowView: View {
    let movie: Movie
    let cast: Cast
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: "\(Constants.imageBaseUrl)\(cast.profilePath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(lineWidth: 2)
                            .foregroundColor(.yellow)
                    }
            } placeholder: {
                ProgressView()
            }
            
            Text(cast.name ?? "")
                .font(.system(size: 8))
                .multilineTextAlignment(.center)
                .lineLimit(1)
        }
        .frame(width: 100, height: 100)
    }
}

struct CastRowView_Previews: PreviewProvider {
    static var previews: some View {
        CastRowView(movie: Movie.dummyData.first!, cast: Cast.dummyData.first!)
        
    }
}
