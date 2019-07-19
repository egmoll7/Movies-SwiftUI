//
//  ContentView.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI
import Combine

struct NowShowingView : View {
    // MARK: - Properties
    let viewModel = NowShowingViewModel()
    
    // MARK: - UI
    var body: some View {
        NavigationView {
            List(viewModel.movieList.movies) { movie in
                NavigationLink(destination: MovieDetails(movie: movie)) {
                    MovieCell(movie: movie)
                }
            }.navigationBarTitle(Text("Now Showing"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        NowShowingView()
    }
}
#endif
