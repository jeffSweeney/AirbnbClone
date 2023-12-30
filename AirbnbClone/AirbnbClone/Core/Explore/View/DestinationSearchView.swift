//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Jeffrey Sweeney on 12/29/23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var showSelf: Bool
    @State private var destination = ""
    @State private var currentDestinationOption: DestinationSearchOptions = .location
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.snappy) {
                    showSelf.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            // MARK: - Where?
            VStack(alignment: .leading) {
                if currentDestinationOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedCard(title: "Where", description: "Add destination")
                }
            }
            .padding()
            .frame(height: currentDestinationOption == .location ? 120 : 64)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { currentDestinationOption = .location }
            }
            
            // MARK: - When?
            VStack {
                if currentDestinationOption == .dates {
                    Text("Show expanded view")
                } else {
                    CollapsedCard(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: currentDestinationOption == .dates ? 120 : 64)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { currentDestinationOption = .dates }
            }
            
            // MARK: - Who?
            VStack {
                if currentDestinationOption == .guests {
                    Text("Show expanded view")
                } else {
                    CollapsedCard(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: currentDestinationOption == .guests ? 120 : 64)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) { currentDestinationOption = .guests }
            }
        }
    }
}

#Preview {
    DestinationSearchView(showSelf: .constant(true))
}

// MARK: - Subviews
struct CollapsedCard: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
