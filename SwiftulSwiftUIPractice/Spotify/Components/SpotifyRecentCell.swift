//
//  SpotifyRecentCell.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/24/24.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    
    var body: some View {
        HStack(spacing: 16, content: {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)

            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
            })
            .padding(.trailing, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .themeColors(isSelected: false)
            .clipShape(.rect(cornerRadius: 6))
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
        }
    }
}
