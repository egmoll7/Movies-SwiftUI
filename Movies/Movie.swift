//
//  Movie.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import SwiftUI
import Combine

class Movie: NSObject, Identifiable, Decodable, BindableObject {
    
    let didChange = PassthroughSubject<Void, Never>()
    
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
    var image: UIImage = UIImage()
    
    init(id: Int, rating: Float, title: String, posterPath: String, overview: String) {
        self.id = id
        self.rating = rating
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
        
    }
    
    private func loadImage(imagePath: String) {
        APIManager().getImage(path: imagePath) { result in
            switch result {
            case .success(let image):
                self.image = image
            default:
                return
            }
            DispatchQueue.main.async {
                self.didChange.send(())
            }
        }
    }
}

struct MovieList: Decodable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
