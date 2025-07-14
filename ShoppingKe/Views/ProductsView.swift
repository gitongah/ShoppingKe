//
//  ProductsView.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 7/14/25.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var viewModel: ShoppingViewModel
    let category: String
    
    var filteredProducts: [ShoppingData] {
        viewModel.categories[category] ?? []
    }
    var body: some View {
            List(filteredProducts) { item in
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
            }.navigationTitle(category.capitalized)
                .navigationDestination(for: ShoppingData.self,) { item in
                    DetailView(item: item)
                    
                }
            
        

    }
}

//#Preview {
//    ProductsView()
//}
