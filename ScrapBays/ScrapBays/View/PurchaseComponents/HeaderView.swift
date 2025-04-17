//
//  HeaderView.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import SwiftUI

struct HeaderView: View {
    var onBack: () -> Void

    var body: some View {
        HStack {
            Button(action: onBack) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }
}
