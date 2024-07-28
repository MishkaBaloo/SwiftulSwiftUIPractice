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
    
    var work: String {
        "Apple Developer"
    }
    
    var education: String {
        "NUWM Programmer "
    }
    
    var aboutMe: String {
        "This is a sentence about me that will look good in my profile!"
    }
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: education),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.starts.fill", emoji: nil, text: "Virgo")
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "👟", text: "running"),
            UserInterest(iconName: nil, emoji: "🏋🏻", text: "Gym"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🥘", text: "Cooking")
        ]
    }
    
    var images: [String] {
        ["https://picsum.photos/800/900", "https://picsum.photos/500/600", "https://picsum.photos/600/700"]
    }
  
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
