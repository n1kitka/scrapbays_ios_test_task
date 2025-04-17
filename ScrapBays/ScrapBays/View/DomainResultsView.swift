//
//  DomainResultsView.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import SwiftUI

struct DomainResultsView: View {
    @ObservedObject var viewModel: DomainSearchViewModel
    
    var body: some View {
        if viewModel.results.isEmpty {
            EmptyView()
        } else {
            ScrollView {
                ForEach(viewModel.results) { domain in
                    NavigationLink(destination: DomainPurchaseView(domain: domain)) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(domain.domain)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(domain.isAvailable ? "Available" : "Unavailable")
                                .font(.subheadline)
                                .foregroundColor(domain.isAvailable ? .green : .red)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}

