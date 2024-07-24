//
//  ProductsTest.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/24/24.
//

import SwiftUI


struct ProductsTest: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack {
//                ForEach(users) { user in
//                    Text(user.email)
//                }
                
                ForEach(products) { product in
                    Text(product.title)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
}
    #Preview {
        ProductsTest()
    }
