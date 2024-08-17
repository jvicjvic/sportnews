//
//  ProductionTeamRepository.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import Foundation

final class ProductionTeamRepository: TeamRepository {
    private let networkService: AthleticNetworkService = AthleticNetworkService()

    func fetchTeams() async throws -> [Team] {
        try await networkService.fetchTeams()
    }
}
