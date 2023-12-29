//
//  ListingFeature.swift
//  AirbnbClone
//
//  Created by Jeffrey Sweeney on 12/29/23.
//

import SwiftUI

struct ListingFeature: View {
    let image: Image
    let featureTitle: String
    let featureCaption: String
    
    var body: some View {
        HStack(spacing: 16) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            VStack(alignment: .leading) {
                Text(featureTitle)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(featureCaption)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ListingFeature(image: Image(systemName: "door.left.hand.open"), featureTitle: "Self check-in", featureCaption: "Check yourself in with the keypad")
}
