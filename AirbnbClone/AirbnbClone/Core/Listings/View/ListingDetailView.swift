//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Jeffrey Sweeney on 12/29/23.
//

import MapKit
import SwiftUI

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            // MARK: - Carousel View
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }

            }
            
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
            .padding(6)
            
            Divider()
            
            // MARK: - Room Configuration
            VStack(alignment: .leading) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ... 4, id: \.self) { room in
                            VStack(alignment: .leading, spacing: 4) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(room)")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 132, height: 100, alignment: .leading)
                            .padding(.leading)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding(6)
            
            Divider()
            
            // MARK: - Listing Offers
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(0 ..< offers.count, id: \.self) { offerIndex in
                    let (image, offer) = offers[offerIndex]
                    
                    HStack(spacing: 16) {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text(offer)
                            .font(.footnote)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 6)
                }
            }
            .padding(6)
            
            Divider()
            
            // MARK: - Map View
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(6)
        }
        .padding(.bottom, 72)
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Jan 14 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

// MARK: - Temporary Dummy Data
extension ListingDetailView {
    var features: [ListingFeature] {
        [
            ListingFeature(image: Image(systemName: "door.left.hand.open"),
                           featureTitle: "Self check-in",
                           featureCaption: "Check yourself in with the keypad"),
            ListingFeature(image: Image(systemName: "medal"),
                           featureTitle: "Superhost",
                           featureCaption: "Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.")
        ]
    }
    
    var offers: [(Image, String)] {
        [
            (Image(systemName: "wifi"), "Wifi"),
            (Image(systemName: "checkerboard.shield"), "Alarm System"),
            (Image(systemName: "building"), "Balcony"),
            (Image(systemName: "washer"), "Laundry"),
            (Image(systemName: "tv"), "TV"),
        ]
    }
}

#Preview {
    ListingDetailView()
}
