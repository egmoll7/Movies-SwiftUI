//
//  ContentView.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI

struct NowShowingView : View {
    // MARK: - Properties
    var viewModel = NowShowingViewModel()
    
    // MARK: - UI
    var body: some View {
        NavigationView {
            List(viewModel.movieList.movies) { movie in
                NavigationButton(destination: MovieDetails(movie: movie)) {
                    MovieCell(movie: movie)
                }
            }
            .navigationBarTitle(Text("Now Showing"))
        }
    }
    
    // MARK: - Private Methods
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        NowShowingView()
    }
}
#endif
