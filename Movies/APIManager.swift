//
//  APIManager.swift
//  Movies
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import Foundation
import NetworkService

struct APIManager {
    
    private enum APIConstants {
        static let apiKey = "53ac772a5ea4e7e6b5089a8b1935c3eb"
        static let baseThumbanilURL = "https://image.tmdb.org/t/p/w500"
    }
    
    func getNowShowing(_ completion: @escaping (Result<MovieList, Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing") else { return }
        let paramaters = ["api_key": APIConstants.apiKey]
        
        NetworkService.shared.get(url: url, parameters: paramaters) { result in
            switch result {
            case .success(let data):
                do {
                    let movies = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(movies))
                } catch {
                    completion(.failure(error))
                    return
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getImage(path: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseThumbanilURL)\(path)") else { return }
        
        NetworkService.shared.get(url: url) { result in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)!
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
