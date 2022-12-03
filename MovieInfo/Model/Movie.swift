//
//  Movie.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/21/22.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let voteCount: Int
    let voteAverage: Double
}

extension Movie {
    static let dummyData: [Movie] = [
        Movie(id: 453395, overview: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", posterPath: "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg", releaseDate: "2022-05-04", title: "Doctor Strange in the Multiverse of Madness", voteCount: 100, voteAverage: 7.5),
        Movie(id: 453395, overview: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", posterPath: "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg", releaseDate: "2022-05-04", title: "Doctor Strange in the Multiverse of Madness", voteCount: 20, voteAverage: 7.5),
        Movie(id: 453395, overview: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", posterPath: "/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg", releaseDate: "2022-05-04", title: "Doctor Strange in the Multiverse of Madness", voteCount: 300000, voteAverage: 7.5),
    ]
}
