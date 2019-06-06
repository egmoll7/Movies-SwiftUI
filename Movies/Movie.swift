//
//  Movie.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI

struct Movie: Identifiable, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case rating = "vote_average"
        case title
        case posterPath = "poster_path"
        case overview
    }
    
    let id: Int
    let rating: Float
    let title: String
    let posterPath: String
    let overview: String
}

struct MovieList: Decodable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
