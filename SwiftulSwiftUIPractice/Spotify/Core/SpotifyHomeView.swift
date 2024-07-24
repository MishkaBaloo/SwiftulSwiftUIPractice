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
    @State private var productRows: [ProductRow] = []

    
    
    var body: some View {
        ZStack {
                    Color.spotifyBlack.ignoresSafeArea()
                    
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 1,
                                   pinnedViews: [.sectionHeaders],
                                   content: {
                            Section {
                                VStack(spacing: 16) {
                                    recentsSection
                                        .padding(.horizontal, 16)
                                    
                                    if let product = products.first {
                                        newRelaseSection(product: product)
                                            .padding(.horizontal, 16)
                                    }
                                    listRows
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
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand}))
            for brand in allBrands {
//                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productRows = rows
        } catch  {
            
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
                    title: product.title
                )
                .asButton(.press) {
                    
                }
            }
        }
    }
    
    private func newRelaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.brand,
            title: product.title,
            subtitle: product.brand,
            onAddToPlaylistPressed: {
                
            },
            onPlayPressed: {
                
            }
        )
    }

    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal, 16)

                
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                            ImageTitleRowCell(
                                imageSize: 120,
                                imageName: product.firstImage,
                                title: product.title
                            )
                            .asButton(.press) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 18)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
}

#Preview {
    SpotifyHomeView()
}
