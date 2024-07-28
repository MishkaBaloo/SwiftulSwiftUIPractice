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
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay{
                WebImage(url: URL(string: urlString))
//                WebImage(url: URL(string: urlStringMishka))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsTightening(false)
            }
            .clipped()
    }
}

struct MyImageLoaderView: View {
    
    var urlStringMishka: String = MishkaPicture.mishka
    var resizingMode: ContentMode = .fill

    var body: some View {
            Rectangle()
                .opacity(0.001)
                .overlay{
                    WebImage(url: URL(string: urlStringMishka))
                        .resizable()
                        .indicator(.activity)
                        .aspectRatio(contentMode: resizingMode)
                        .allowsTightening(false)
                }
                .clipped()
    }
}

#Preview {
    VStack {
        MyImageLoaderView()
        ImageLoaderView()
            .clipShape(.rect(cornerRadius: 30))
            .padding(40)
            .padding(.vertical, 60)
    }
}
