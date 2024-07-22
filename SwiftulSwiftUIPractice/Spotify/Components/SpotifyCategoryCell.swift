//
//  SpotifyCategoryCell.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/22/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool  = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 30)
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSelected: true)
            SpotifyCategoryCell(isSelected: true)
        }
    }
}
