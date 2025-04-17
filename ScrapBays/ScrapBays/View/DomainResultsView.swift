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
                    NavigationLink(destination: DomainPurchaseView()) {
                        Text(domain.domain)
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 24)
                            .padding(.horizontal)
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

