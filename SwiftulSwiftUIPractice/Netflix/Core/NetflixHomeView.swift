//
//  NetflixHomeView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/31/24.
//

import SwiftUI

struct NetflixHomeView: View {
    
    @State private var filter = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                NetflixFilterBarView(
                    filters: filter,
                    selectedFilter: selectedFilter,
                    onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    },
                    onXMarkPressed:  {
                        selectedFilter = nil
                    }
                )
                .padding(.top, 16)
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View {
        
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16, content: {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            })
            .font(.title2)
            
        }
    }
}

#Preview {
    NetflixHomeView()
}
