//
//  User.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/21/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Double
    let weight: Double
  
    static var mock: User {
        User(
            id: 444,
            firstName: "Michael",
            lastName: "Tokmakov",
            age: 20,
            email: "misha.tokmak@gmail.com",
            phone: "+380633655213",
            username: "mishkabaloo",
            password: "1111",
            image: Constants.randomImage,
            height: 180,
            weight: 78
        )
    }
    
}
