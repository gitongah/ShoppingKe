//
//  ShoppingData.swift
//  ShoppingKe
//
//  Created by Edwin Mbaabu on 6/20/25.
//

import Foundation

struct ShoppingData: Codable , Identifiable, Hashable{
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
}
struct Rating: Codable, Hashable {
    var rate: Double
    var count: Int
}
