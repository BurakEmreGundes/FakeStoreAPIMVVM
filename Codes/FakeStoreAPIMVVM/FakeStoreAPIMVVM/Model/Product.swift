//
//  Product.swift
//  FakeStoreAPIMVVM
//
//  Created by Burak Emre gündeş on 21.03.2022.
//

import Foundation

// MARK: - Welcome1Element
struct ProductModel : Codable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

// MARK: - Rating
struct Rating : Codable {
    let rate: Double
    let count: Int
}


