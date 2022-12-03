//
//  ContentView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var searchButtonPressed = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Now Playing")
                    .font(.headline)
                    .padding(.horizontal)

                NowPlayingView()
                    .padding(.top, -40)

                Text("Popular Movies")
                    .font(.headline)
                    .padding(.horizontal)
                   
                PopularMovieView()
                    .padding(.top, -40)
            }
            .navigationTitle("Movies")
        }
        .accentColor(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
