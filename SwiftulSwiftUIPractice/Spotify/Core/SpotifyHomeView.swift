//
//  SpotifyHomeView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/22/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 2,pinnedViews: [.sectionHeaders],  content: {
                    Section {
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
            currentUser = try await DataBaseHelper().getUsers().first
//            products = try await DataBaseHelper().getProducts()
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
}

#Preview {
    SpotifyHomeView()
}
