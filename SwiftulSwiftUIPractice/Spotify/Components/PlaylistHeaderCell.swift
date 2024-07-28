//
//  PlaylistHeaderCell.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/25/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Some playlist title goes here"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.randomImage
    var mishkaImage: String  = MishkaPicture.mishka
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
//                ImageLoaderView(urlString: mishkaImage)
            }
            .overlay(alignment: .bottomLeading, content: {
                VStack(alignment: .leading,spacing: 8, content: {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                })
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .top,
                        endPoint: .bottom)
                    )
            })
            .asStretchyHeader(startingHeight: height) // zoom after scrolling header
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
