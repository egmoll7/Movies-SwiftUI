//
//  NowShowingViewModel.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI
import Combine

class NowShowingViewModel {
    
    @Published var movieList = MovieList(movies: [])
    
    init() {
        loadData()
    }
    
    func loadData() {
        let subcriber = Subscribers.Sink<MovieList, Error> {
            self.movieList = $0
        }
        
        APIManager().nowShowing().subscribe(subcriber)
    }
    
    
}

