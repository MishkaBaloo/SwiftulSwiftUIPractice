//
//  ImageTitleRowCell.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/24/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "some item name"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
            
        })
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
    
}
