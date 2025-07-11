//
//  ContentView.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 6/20/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ShoppingViewModel(networkManager: NetworkManager())
    var body: some View {
        NavigationStack {
            List(viewModel.shoppingData) { item in
                NavigationLink(value: item) {
                    HStack(alignment: .top) {
                        AsyncImage(url: URL(string: item.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(width: 44, height: 44)
                        }
                        
                        VStack(alignment: .leading){
                            Text(item.title)
                                .font(.headline)

                        }
                    }
                }
                
                
            }.navigationTitle("Products")
                .navigationDestination(for: ShoppingData.self) { item in
                    DetailView(item: item)
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
