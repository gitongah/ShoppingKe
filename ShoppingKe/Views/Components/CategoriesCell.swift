//
//  CategoriesCell.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 7/14/25.
//

import SwiftUI

struct CategoriesCell: View {
    //i here we are going to crate a cell that will hve something like the nike shop categories
    let viewModel: ShoppingViewModel
    var body: some View {
        List(viewModel.categories.keys.sorted(), id: \.self) { category  in
            NavigationLink(value: category) {
                ZStack {
                    LinearGradient(colors: [Color(.systemGray5), Color(.systemGray5)],
                                   startPoint: .leading,
                                   endPoint: .trailing
                    ).cornerRadius(10)
                    HStack {
                        Text(category.capitalized)
                        .font(.headline)
                        .foregroundStyle(.black)
                        
                        Spacer()
                    }
                    .padding()
                }
                .buttonStyle(.plain)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)

                                }
            
        }.onAppear {
            viewModel.fetchShoppingData()
        }
    }
}

//#Preview {
//    CategoriesCell(viewModel: viewModel)
//}
