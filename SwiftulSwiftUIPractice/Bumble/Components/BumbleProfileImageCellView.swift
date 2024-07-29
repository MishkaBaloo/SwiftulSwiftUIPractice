//
//  BumbleProfileImageCellView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/29/24.
//

import SwiftUI

struct BumbleProfileImageCellView: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90)) // rotation to top
                .scaleEffect(x: -1, y: 1, anchor: .center) // flip to left point
            
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)
        }
        .frame(width: 75, height: 75)
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
        }
    }
}

#Preview {
    VStack {
        BumbleProfileImageCellView()
        BumbleProfileImageCellView(percentageRemaining: 1)
        BumbleProfileImageCellView(percentageRemaining: 0)
        BumbleProfileImageCellView(hasNewMessage: false)
    }
}
