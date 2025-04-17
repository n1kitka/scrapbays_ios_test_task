//
//  DomainNetworkService.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import Foundation

class DomainNetworkService {
    func search(domain: String) async throws -> [Domain] {
        guard domain.count >= 3 else { return [] }

        let urlString = "https://api.domainsdb.info/v1/domains/search?domain=\(domain)&zone=com"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode(DomainSearchResponse.self, from: data)
        return decoded.domains ?? []
    }
}
