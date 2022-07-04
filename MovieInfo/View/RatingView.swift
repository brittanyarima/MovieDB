//
//  RatingView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/22/22.
//

import SwiftUI

struct RatingView: View {
    let movie: Movie
    
    private static let COLOR = Color.yellow // The color of the stars
    
 
    var fullCount: Int {
        Int(movie.voteAverage )
    }
    
    var emptyCount: Int {
        Int(10.0 - (movie.voteAverage ))
    }
    
    var halfFullCount: Int {
        (fullCount + emptyCount) < 10 ? 1 : 0
    }
    
    
    private var fullStar: some View {
        Image(systemName: "star.fill")
            .foregroundColor(RatingView.COLOR)
            .font(.system(size: 10))
        
    }
    
    private var halfFullStar: some View {
        Image(systemName: "star.lefthalf.fill")
            .foregroundColor(RatingView.COLOR)
            .font(.system(size: 10))
    }
    
    private var emptyStar: some View {
        Image(systemName: "star")
            .foregroundColor(RatingView.COLOR)
            .font(.system(size: 10))
    }
    
    
    var body: some View {
        HStack {
             
            ForEach(0..<fullCount, id: \.self) { _ in
                self.fullStar
            }
            ForEach(0..<halfFullCount, id: \.self) { _ in
                self.halfFullStar
            }
            ForEach(0..<emptyCount, id: \.self) { _ in
                self.emptyStar
            }
            
            
            
            
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(movie: Movie.dummyData.first!)
    }
}
