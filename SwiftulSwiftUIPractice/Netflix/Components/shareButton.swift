//
//  shareButton.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 8/3/24.
//

import SwiftUI

struct shareButton: View {
    
    var url: String = "https://github.com/MishkaBaloo"
    
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(Color.black.opacity(0.001 ))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        shareButton()
    }
}
