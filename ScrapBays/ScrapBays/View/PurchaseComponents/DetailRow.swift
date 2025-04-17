//
//  DetailRow.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import SwiftUI

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
    }
}
