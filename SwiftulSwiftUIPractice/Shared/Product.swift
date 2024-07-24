//
//  Product.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/21/24.
//


struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String

    var firstImage: String {
        images.first ?? Constants.randomImage
    }
}
