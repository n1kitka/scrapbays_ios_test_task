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
            VStack {
                TextField("Search domain...", text: $viewModel.query)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            .navigationTitle("Domain Search")
        }
    }
}

#Preview {
    DomainSearchView()
}
