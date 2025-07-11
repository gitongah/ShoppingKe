//
//  DetailView.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 7/11/25.
//

import SwiftUI

struct DetailView: View {
    let item:ShoppingData
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: item.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }placeholder: {
                    ProgressView()
                }
                //Category
                Text("Category: \(item.category)")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(item.title)
                    .font(.headline)
                
                Text("Price: \(String(format: "%.2f", item.price))$")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Text("Ratting: \(String(format: "%.1f", item.rating.rate))")
                    Text("(\(item.rating.count) reviews)")
                        .foregroundStyle(.secondary)
                    
                }
                .font(.footnote)
                Button {
                    //Action to buy the product
                } label: {
                    Text("Buy Now")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

            }
        }
        .navigationTitle("Details")
        
    }
    
}

//#Preview {
//    DetailView( item: ShoppingData )
//}
