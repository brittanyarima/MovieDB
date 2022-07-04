//
//  MainView.swift
//  MovieInfo
//
//  Created by Brittany Rima on 7/3/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                       
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        
                }
              
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
