//
//  ApiCall.swift
//  Test
//
//  Created by Kunal's MacBook on 02/02/22.
//

import Foundation

struct ITunesResult: Codable {
    let results: [Album]
}

struct Album: Codable, Hashable {
    let collectionId: Int
    let collectionName: String
    let collectionPrice: Double
}


struct AlbumsFetcher {
    
    enum AlbumsFetcherError: Error {
        case invalidURL
        case missingData
    }
    
    static func fetchAlbums(completion: @escaping (Result<[Album], Error>) -> Void) {
        
        // Create URL
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=album") else {
            completion(.failure(AlbumsFetcherError.invalidURL))
            return
        }
        
        // Create URL session data task
        URLSession.shared.dataTask(with: url) { data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(AlbumsFetcherError.missingData))
                return
            }
            
            do {
                // Parse the JSON data
                let iTunesResult = try JSONDecoder().decode(ITunesResult.self, from: data)
                completion(.success(iTunesResult.results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    
    
    
    @available(iOS 15.0, *)
    static func fetchAlbumWithAsyncURLSession() async throws -> [Album] {

        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=album") else {
            throw AlbumsFetcherError.invalidURL
        }

        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        if #available(iOS 15.0, *) {
            let (data, _) = try await URLSession.shared.data(from: url)
            let iTunesResult = try JSONDecoder().decode(ITunesResult.self, from: data)
            return iTunesResult.results
        } else {
            return []
        }

        // Parse the JSON data
        
    }
}


