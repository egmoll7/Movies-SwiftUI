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
    var movieList: MovieList = MovieList(movies: [])
    
    init() {
        APIManager().getNowShowing { (result) in
            switch result {
            case .success(let movies):
                self.movieList = movies
            default:
                return
            }
        }
    }
}

