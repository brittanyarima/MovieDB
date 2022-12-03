//
//  NowPlayingViewModel.swift
//  MovieInfo
//
//  Created by Brittany Rima on 7/1/22.
//

import Foundation

class NowPlayingViewModel: ObservableObject {

    @Published var fetchedMovies: [Movie] = []
    @Published var page = 1
    let movieUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(Constants.apiKey)&language=en-US&page="

    func fetchMovies() async {
        guard let url = URL(string:"\(movieUrl)\(page)") else {
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
                    self.fetchedMovies.append(contentsOf: decodedData.results)
                }
            }
        } catch {
            print("Invalid Data")
        }
    }
}
