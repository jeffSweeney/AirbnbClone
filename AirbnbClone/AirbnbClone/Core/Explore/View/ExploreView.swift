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
                LazyVStack(spacing: 32) {
                    SearchAndFilterBar()
                    
                    ForEach(0...10, id: \.self) { listing in
                        ListingItemView()
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
