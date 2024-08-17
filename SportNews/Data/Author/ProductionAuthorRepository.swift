//
//  ProductionAuthorRepository.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

final class ProductionAuthorRepository: AuthorRepository {
    private let networkService: AthleticNetworkService = AthleticNetworkService()

    func fetchAuthors() async throws -> [Author] {
        try await networkService.fetchAuthors()
    }
}
