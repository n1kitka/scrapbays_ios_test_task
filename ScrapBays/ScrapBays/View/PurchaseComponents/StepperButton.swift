//
//  StepperButton.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import SwiftUI

struct StepperButton: View {
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundColor(.black)
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
        }
    }
}
