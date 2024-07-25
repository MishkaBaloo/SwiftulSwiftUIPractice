//
//  Product.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/21/24.
//

import Foundation

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
    let brand: String? // only non optional can load
//    let brand: String
    let sku: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String
    
    
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Example product title",
            description: "This is some mock product description goes here",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            tags: ["Cosmetic", "Lips", "Apple"],
            brand: "Dior",
            sku: "sku",
            weight: 2,
            warrantyInformation: "Good",
            shippingInformation: "Goes",
            minimumOrderQuantity: 1,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage ],
            thumbnail: Constants.randomImage
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
