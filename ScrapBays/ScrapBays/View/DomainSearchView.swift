//
//  ContentView.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import SwiftUI

struct DomainSearchView: View {
    @StateObject private var viewModel = DomainSearchViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.1).ignoresSafeArea()
                VStack {
                    TextField("Search for a domain...", text: $viewModel.query)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .textFieldStyle(PlainTextFieldStyle())
                        .font(.system(size: 28, weight: .medium))
                    
                    DomainResultsView(viewModel: viewModel)
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    DomainSearchView()
}
