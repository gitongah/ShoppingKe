//
//  NetworkManager.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 6/20/25.
//

import Foundation
import Combine

enum ErrorType: Error {
    case networkError
    case decodingError
    case invalidURL
}
protocol Network {
    func fetchProducts<T: Decodable>(from url: URL) -> AnyPublisher<T, Error>
    
}
class NetworkManager: Network {
    func fetchProducts<T>(from url: URL) -> AnyPublisher<T, any Error> where T : Decodable {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
//    func fetchProducts<T: Decodable>(from url: URL) -> AnyPublisher<T, Error> {
//        URLSession.shared.dataTaskPublisher(for: url)
//            .tryMap{ (data, response) -> Data in
//                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
//            .decode(type: T.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//        
//    }
    
}
