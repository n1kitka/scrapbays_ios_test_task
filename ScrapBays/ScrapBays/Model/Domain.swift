//
//  Domain.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import Foundation

struct DomainSearchResponse: Codable {
    let domains: [Domain]?
}

struct Domain: Codable, Identifiable {
    var id: String { domain }

    let domain: String
    let isDead: String
    let country: String?
    let create_date: String?
    let update_date: String?

    var isAvailable: Bool {
        return isDead.lowercased() == "false"
    }
}

