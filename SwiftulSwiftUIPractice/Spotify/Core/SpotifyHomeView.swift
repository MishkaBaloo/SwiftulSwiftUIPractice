//
//  SpotifyHomeView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/22/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 2,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        
                        VStack(spacing: 16) {
                            recentsSection
                            
                            if let product = products.first {
                                newReelaseSection(product: product)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack {
            ZStack {
                if let currentUser {
//                    ImageLoaderView(urlString: ProfilePicture.myProfileImage)
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 45, height: 45)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { cateory in
                         SpotifyCategoryCell(
                            title: cateory.rawValue.capitalized,
                            isSelected: cateory == selectedCategory
                            )
                         .onTapGesture {
                             selectedCategory = cateory
                         }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spotifyBlack)
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentCell(
                    imageName: product.firstImage,
                    title: product.title)
            }
        }
    }
    
    private func newReelaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.shippingInformation,
            title: product.title,
            subtitle: product.brand,
            onAddToPlaylistPressed: {
                
            },
            onPlayPressed: {
                
            }
        )
    }

}

#Preview {
    SpotifyHomeView()
}
