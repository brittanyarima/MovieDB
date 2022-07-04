//
//  TrendingViewModel.swift
//  MovieInfo
//
//  Created by Brittany Rima on 7/2/22.
//

import Foundation




class TrendingViewModel: ObservableObject {
    @Published var fetchedMovies: [Movie] = []
    let movieUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=925efd54ae6d96d9ae2c1f8891d90f60"
    
    func fetchMovies() async {
        guard let url = URL(string:"\(movieUrl)") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            if let decodedData = try? decoder.decode(MovieResponse.self, from: data) {
                print("Decoded Cast Data")

                DispatchQueue.main.async {
                    self.fetchedMovies = decodedData.results
                }

            }
        } catch {
            print("Invalid Data")
        }
    }
}
