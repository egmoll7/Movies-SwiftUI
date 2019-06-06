//
//  NetworkService.swift
//  NetworkService
//
//  Created by Eduardo Moll on 6/5/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case http(Int)
    case emptyData
    case unableToCreateRequest
}

public struct NetworkService {
    
    public static let shared = NetworkService()
    public typealias Compleiton = (Result<Data, Error>) -> Void
    
    public func get(url: URL, parameters: [String: String]? = nil , completion: @escaping Compleiton) {
        guard var urlComponents = URLComponents(string: url.absoluteString) else {
            completion(.failure(NetworkError.unableToCreateRequest))
            return
        }
        
        if let parameters = parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value ) }
        }
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(NetworkError.unableToCreateRequest))
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(Result.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.emptyData))
                return
            }
            
            completion(.success(data))
            
        }.resume()
    }
}
