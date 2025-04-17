//
//  YearSelector.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import SwiftUI

struct YearSelector: View {
    @Binding var years: Int

    var body: some View {
        HStack {
            Text("Years to register")
                .foregroundColor(.gray)

            Spacer()

            HStack(spacing: 16) {
                StepperButton(icon: "minus") {
                    if years > 1 { years -= 1 }
                }

                Text("\(years) year\(years > 1 ? "s" : "")")
                    .frame(minWidth: 60)

                StepperButton(icon: "plus") {
                    years += 1
                }
            }
        }
    }
}
