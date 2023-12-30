//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Jeffrey Sweeney on 12/29/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(showSelf: $showDestinationSearchView)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32) {
                        ForEach(0...10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                            }
                        }
                    }
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
