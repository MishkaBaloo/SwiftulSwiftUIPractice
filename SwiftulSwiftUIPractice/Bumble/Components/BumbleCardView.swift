//
//  BumbleCardView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/28/24.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var user: User = .mock
    var onSendAComplimentPressed: (() -> Void)? = nil
    var onHandsomeButtonPressed: (() -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    var onCheckmarkPressed: (() -> Void)? = nil
    var onHideAndReportPressed: (() -> Void)? = nil
    
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0,
                       content: {
                
                headerCell
                    .frame(height: cardFrame.height)
                aboutMeSection
                myInterestsSection
                ForEach(user.images, id: \.self) { image in
                    ImageLoaderView(urlString: image)
                        .frame(height: cardFrame.height)
                }
                locationSection
                footerSection
            })
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBackgroundYellow)
        .overlay(alignment: .bottomTrailing) {
            handsomeButton
                .padding(24)
        }
        .clipShape(.rect(cornerRadius: 32))
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }
    
    private var headerCell: some View {
        ZStack(alignment: .bottomLeading ,
               content: {
            MyImageLoaderView(urlStringMishka: MishkaPicture.mishka)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                BumbeHeartView()
                    .onTapGesture {
                        onSendAComplimentPressed?()
                    }
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            
        })
    }
    
    private var handsomeButton: some View {
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay {
                Image(systemName: "star.fill")
                    .foregroundStyle(.bumbleBlack)
                    .font(.system(size: 30, weight: .medium))
            }.onTapGesture {
                onHandsomeButtonPressed?()
            }
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12, content: {
            sectionTitle(title: "About Me")
            
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            HStack(spacing: 0, content: {
                BumbeHeartView()
                
                Text("Send a compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            })
            .padding([.horizontal, .trailing], 8)
            .background(.bumbleYellow)
            .clipShape(.rect(cornerRadius: 32))
            .onTapGesture {
                onSendAComplimentPressed?()
            }
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
    }
    
    private var myInterestsSection: some View {
        VStack(alignment: .leading, spacing: 12, content: {
            VStack(alignment: .leading, spacing: 8, content: {
                sectionTitle(title: "My basics")
                InterestPillGridView(interests: user.basics)
            })
            
            VStack(alignment: .leading, spacing: 8, content: {
                sectionTitle(title: "My intrerets")
                InterestPillGridView(interests: user.interests)
            })
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
    }
    
    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 12, content: {
            HStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text(user.firstName + "'s Location")
            }
            .foregroundStyle(.bumbleGray)
            .font(.body)
            .fontWeight(.medium)
             
            Text("10 miles away")
                .font(.headline)
                .foregroundStyle(.bumbleBlack)
            
            InterestPillView(iconName: nil, emoji: "🇺🇦", text: "Lives in Rivne, RV")
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
    }
    
    private var footerSection: some View {
        VStack(spacing: 24) {
            HStack(spacing: 0) {
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onXmarkPressed?()
                    }
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    )
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onCheckmarkPressed?()
                    }
            }
            
            Text("Hide and Report ")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onHideAndReportPressed?()
                }
        }
        .padding(.top, 60)
        .padding(.bottom, 60)
        .padding(.horizontal, 32)
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
