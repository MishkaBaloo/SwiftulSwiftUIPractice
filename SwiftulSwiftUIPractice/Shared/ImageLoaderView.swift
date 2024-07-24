//
//  ImageLoaderView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/18/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String =  Constants.randomImage
//    var urlString: String = ProfilePicture.myProfileImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay{
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsTightening(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .clipShape(.rect(cornerRadius: 30))
        .padding(40)
        .padding(.vertical, 60)
}
