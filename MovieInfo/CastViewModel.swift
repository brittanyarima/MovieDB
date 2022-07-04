//
//  CastViewModel.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/25/22.
//

import Foundation


class CastViewModel: ObservableObject {
    @Published var fetchedCast: [Cast] = []
    
    
    
        
    func fetchCast(movieId: Int) async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(Constants.apiKey)&language=en-US") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            if let decodedData = try? decoder.decode(CastResponse.self, from: data) {
                print("Decoded Cast Data")
                
                DispatchQueue.main.async {
                    self.fetchedCast = decodedData.cast
                }
                
            }
        } catch {
            print("Invalid Data")
        }
    }
    
    
}
