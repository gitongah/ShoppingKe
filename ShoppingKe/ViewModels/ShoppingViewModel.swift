//
//  ShoppingViewModel.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 6/20/25.
//

import Foundation
import Combine

@Observable
class ShoppingViewModel: ObservableObject {
    
    private let networkManager: Network
    private var cancellables = Set<AnyCancellable>()
    
    var shoppingData: [ShoppingData] = []
    var errorMessage: String? = nil
    var categories: [String: [ShoppingData]] = [:]
    
    
    init(networkManager: Network) {
        self.networkManager = networkManager
    }
    
    func fetchShoppingData() {
        let urlString = "https://fakestoreapi.com/products"
        
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            return
        }
       
        networkManager.fetchProducts(from: url)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching data: \(error)")
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: {[weak self] products in
                self?.shoppingData = products
                self?.categories = Dictionary(grouping: products, by: { $0.category })
            })
            .store(in: &cancellables)
    }
    
}

