//
//  NetflixHomeView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/31/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixHomeView: View {
    
    @State private var filter = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero
    
    @State private var heroProduct: Product? = nil
    @State private var currentUser: User? = nil
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    if let heroProduct {
                        heroCell(product: heroProduct)
                    }
                    
                    categoryRows
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                NetflixFilterBarView(
                    filters: filter,
                    selectedFilter: selectedFilter,
                    onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    },
                    onXMarkPressed:  {
                        selectedFilter = nil
                    }
                )
                .padding(.top, 16)
            }
            .background(Color.blue)
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
            
            
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard productRows.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.last
            
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
        
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16, content: {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            })
            .font(.title2)
            
        }
    }
    
    private func heroCell(product: Product) -> some View {
        NetflixHeroCell(
            imageName: product.firstImage,
            isNetflixFilm: true,
            title: product.title,
            categories: [product.category.capitalized, (product.brand ?? "") ],
            onBackgroundPressed: {
                
            },
            onPlayPressed: {
                
            },
            onMylistPressed: {
                
            }
        )
        .padding(24)
    }
    
    private var categoryRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(productRows.enumerated()), id: \.offset) { (rowIndex, row) in
                VStack(alignment: .leading,
                       spacing: 6,
                       content: {
                    Text(row.title)
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(Array(row.products.enumerated()), id: \.offset) { (index, producrt) in
                                NetflixMovieCell(
                                    imageName: producrt.firstImage,
                                    title: producrt.title,
                                    isRecentlyAdded: producrt.recentlyAdded,
                                    topTenRanking: rowIndex == 1 ?  (index + 1) : nil
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                })
            }
        }
    }
}

#Preview {
    NetflixHomeView()
}
