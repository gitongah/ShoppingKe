//
//  ContentView.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 6/20/25.
//

import SwiftUI

struct Categories: View {
    @StateObject private var viewModel = ShoppingViewModel(networkManager: NetworkManager())
    var body: some View {
        NavigationStack {
            CategoriesCell(viewModel: viewModel)
                .listStyle(.plain)
                .navigationTitle("Categories")
                .navigationDestination(for: String.self) { category in
                    ProductsView(viewModel: viewModel, category: category)
                }
            
        }
        
    }
}

#Preview {
    Categories()
}
