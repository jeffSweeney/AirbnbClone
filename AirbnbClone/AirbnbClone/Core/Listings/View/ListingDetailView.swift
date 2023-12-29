//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Jeffrey Sweeney on 12/29/23.
//

import SwiftUI

struct ListingDetailView: View {
    // Dummy data for now. Will become dynamic.
    let features: [ListingFeature] = [
        ListingFeature(image: Image(systemName: "door.left.hand.open"), featureTitle: "Self check-in", featureCaption: "Check yourself in with the keypad"),
        ListingFeature(image: Image(systemName: "medal"), featureTitle: "Superhost", featureCaption: "Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.")
    ]
    
    var body: some View {
        ScrollView {
            // MARK: - Carousel View
            ListingImageCarouselView()
                .frame(height: 320)
            
            // MARK: - Listing & Rating
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        RatingView()
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 6)
            
            Divider()
            
            // MARK: - Lister
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Group {
                        Text("Entire villa hosted by")
                        Text("John Smith")
                    }
                    .font(.headline)
                    .fontWeight(.semibold)
                    
                    Text("4 guests - 4 bedrooms - 4 beds - 3 baths")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Image("male-profile-photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding(.vertical)
            .padding(.horizontal, 6)
            
            Divider()
            
            // MARK: - Listing Feature
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0 ..< features.count, id: \.self) { feature in
                    features[feature]
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 6)
            .padding(.horizontal, 6)
            
            Divider()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
}
