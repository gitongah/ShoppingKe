//
//  ContentView.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 6/20/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ShoppingViewModel(networkManager: NetworkManager())
    var body: some View {
        NavigationStack {
            
            List(viewModel.categories.keys.sorted(), id: \.self) { category  in
                NavigationLink(value: category) {
                    Text(category.capitalized)
                    .font(.headline)
                    .padding(.vertical, 8)                }
                
            }.navigationTitle("Categories")
                .navigationDestination(for: String.self) { category in
                    ProductsView(viewModel: viewModel, category: category)
                }
                .onAppear {
                    viewModel.fetchShoppingData()
                }

        }
        
    }
}

#Preview {
    ContentView()
}
