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
    @State private var fromDate = Date()
    @State private var toDate = Date().addingTimeInterval(86400)
    @State private var numGuests = 1
    
    private var earliestCheckout: Date {
        return fromDate.addingTimeInterval(86400)
    }
    
    private var guestCountLabel: String {
        let text = numGuests > 1 ? "Adults" : "Adult"
        
        return "\(numGuests) \(text)"
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        showSelf.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty {
                    Button("Clear") {
                        withAnimation(.snappy) {
                            destination = ""
                            withAnimation(.snappy) { currentDestinationOption = .location }
                            fromDate = Date()
                            toDate = Date().addingTimeInterval(86400)
                            numGuests = 1
                        }
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
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
            .modifier(CollapsibleDestinationViewModifier(height: currentDestinationOption == .location ? 120 : 64))
            .onTapGesture {
                withAnimation(.snappy) { currentDestinationOption = .location }
            }
            
            // MARK: - When?
            VStack(alignment: .leading) {
                if currentDestinationOption == .dates {
                    Text("When is your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $fromDate, in: Date()..., displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $toDate, in: earliestCheckout..., displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedCard(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier(height: currentDestinationOption == .dates ? 180 : 64))
            .onTapGesture {
                withAnimation(.snappy) { currentDestinationOption = .dates }
            }
            
            // MARK: - Who?
            VStack(alignment: .leading) {
                if currentDestinationOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper(guestCountLabel, value: $numGuests, in: 1 ... Int.max)
                } else {
                    CollapsedCard(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier(height: currentDestinationOption == .guests ? 120 : 64))
            .onTapGesture {
                withAnimation(.snappy) { currentDestinationOption = .guests }
            }
            
            Spacer()
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

// MARK: - Custom View Modifiers
struct CollapsibleDestinationViewModifier: ViewModifier {
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: height)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
