//
//  SearchViewModel.swift
//  MovieInfo
//
//  Created by Brittany Rima on 7/2/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchResults: [Movie] = []
    @Published var page = 1
    
    func fetchMovie(searchText: String) async {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(Constants.apiKey )&language=en-US&query=\(searchText)&page=\(page)&include_adult=false") else {
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
                    self.searchResults = decodedData.results
                    
                }
                
            }
        } catch {
            print("Invalid Data")
        }
    }
}
