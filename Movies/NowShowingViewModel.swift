//
//  NowShowingViewModel.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI
import Combine

class NowShowingViewModel: BindableObject {
    
    let didChange = PassthroughSubject<Void, Never>()
    var movieList: MovieList = MovieList(movies: []) {
        didSet {
            self.didChange.send(())
        }
    }
    
    init() {
        APIManager().getNowShowing { (result) in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.movieList = movies
                }
            default:
                return
            }
        }
    }
}

