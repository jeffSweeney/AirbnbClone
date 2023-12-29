//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Jeffrey Sweeney on 12/29/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchAndFilterBar()
                
                LazyVStack(spacing: 32) {
                    ForEach(0...10, id: \.self) { listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self) { listing in
                Text("Listing detail view \(listing) ...")
            }
        }
    }
}

#Preview {
    ExploreView()
}
