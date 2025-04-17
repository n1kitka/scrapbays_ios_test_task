//
//  DomainViewModel.swift
//  ScrapBays
//
//  Created by Nikita on 17.04.2025.
//

import Foundation
import Combine

@MainActor
class DomainSearchViewModel: ObservableObject {
    
    @Published var results: [Domain] = []
    @Published var query: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let service = DomainNetworkService()
    private var searchTask: Task<Void, Never>?
    
    init() {
        observeQuery()
    }

    private func observeQuery() {
        $query
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] newValue in
                self?.performSearch(for: newValue)
            }
            .store(in: &cancellables)
    }

    private func performSearch(for query: String) {
        searchTask?.cancel()
        
        guard query.count >= 3 else {
            results = []
            errorMessage = nil
            return
        }

        searchTask = Task {
            isLoading = true
            errorMessage = nil
            do {
                let domains = try await service.search(domain: query)
                results = domains
            } catch {
                errorMessage = "Failed to fetch domains: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
}
