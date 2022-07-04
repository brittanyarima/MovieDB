//
//  MovieViewModel.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/22/22.
//

import SwiftUI


class MovieViewModel: ObservableObject {
    @Published var fetchedMovies: [Movie] = []
    @Published var page = 1
    let popularMovieUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page="
    

    
    func fetchMovies() async {
        guard let url = URL(string: "\(popularMovieUrl)\(page)") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            if let decodedMovies = try? decoder.decode(MovieResponse.self, from: data) {
                print("Decoded Data")
                
                DispatchQueue.main.async {
                    self.fetchedMovies.append(contentsOf: decodedMovies.results)
                }
               
             
            }
        } catch {
            print("Invalid Data")
        }
    }
        
    
}
