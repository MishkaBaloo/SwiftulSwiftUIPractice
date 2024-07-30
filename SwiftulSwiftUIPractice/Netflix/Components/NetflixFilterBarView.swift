//
//  NetflixFilterBarView.swift
//  SwiftulSwiftUIPractice
//
//  Created by Michael on 7/31/24.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModel] {
        [
            FilterModel(title: "TV Show", isDropdown: false),
            FilterModel(title: "Moview", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true)
        ]
    }
}

struct NetflixFilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var onFilterPressed: ((FilterModel) -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onXMarkPressed?()
                        }
                        .transition(AnyTransition(.move(edge: .leading)))
                        .padding(.leading, 16)
                }
                
                
                ForEach(filters, id: \.self) { filter in
                    
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterCell(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                onFilterPressed?(filter)
                            }
                            .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                    }
                    
                    
                }
            }
            .padding(.vertical, 4) // from not cutting from using stroke
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct NetflixFilterBarViewPreview: View { // action to make possibilty to change or add something thing before the user will see result of his taping/texting
    
    @State private var filter = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
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
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixFilterBarViewPreview()
    }
}
