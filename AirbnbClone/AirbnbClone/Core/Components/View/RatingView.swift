//
//  RatingView.swift
//  AirbnbClone
//
//  Created by Jeffrey Sweeney on 12/29/23.
//

import SwiftUI

struct RatingView: View {
    // TODO: Make dynamic
    var rating: Double {
        // 0.26 type values look bad. Keep dummy data 3+
        Double.random(in: 3.0 ... 5.0)
    }
    
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            
            Text(String(format: "%.2f", rating))
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingView()
}
