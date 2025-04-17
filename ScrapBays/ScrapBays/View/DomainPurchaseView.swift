//
//  DomainPurchaseView.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import SwiftUI

struct DomainPurchaseView: View {
    let domain: Domain
    @Environment(\.presentationMode) var presentationMode

    @State private var years = 1
    @State private var showConfirmation = false

    var totalPrice: Int {
        return 100 * years
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView {
                presentationMode.wrappedValue.dismiss()
            }

            Text(domain.domain)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.vertical, 20)

            Spacer()

            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    Text("Registration price")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("$100")
                        .font(.system(size: 44, weight: .bold))
                }

                YearSelector(years: $years)

                DetailRow(label: "Domain privacy", value: "Included")
                DetailRow(label: "SSL certificate", value: "Included")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(30)
            .padding()

            VStack(spacing: 25) {
                HStack {
                    Text("Total")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("$\(totalPrice)")
                        .font(.title3)
                        .fontWeight(.semibold)
                }

                Button(action: {
                    showConfirmation = true
                }) {
                    Text("Purchase domain")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(40)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(30)
            .padding([.horizontal, .bottom])
        }
        .background(Color.black.opacity(0.1).ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .alert("Success", isPresented: $showConfirmation) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("You have successfully purchased \(domain.domain)!")
        }
    }
}



