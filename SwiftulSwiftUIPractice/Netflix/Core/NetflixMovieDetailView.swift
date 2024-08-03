//
//  NetflixMovieDetailView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 8/3/24.
//

import SwiftUI

struct NetflixMovieDetailView: View {
    
    var product: Product = .mock
    
    @State private var progress: Double = 0.2
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress,
                    onAirplayPressed: {
                        
                    },
                    onXMarkPressed: {
                        
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(spacing: 16) {
                        NetflixDetailsProductView(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2024",
                            seasonCount: 4,
                            hasClosedCaptions: true,
                            isTopTen: 6,
                            descriptionText: product.description,
                            castText: "Cast: Michael, Alex, Nick",
                            onPlayPressed: {
                                
                            },
                            onDownloadPressed: {
                                
                            }
                        )
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    NetflixMovieDetailView()
}
