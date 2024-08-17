//
//  ProductionLeagueRepository.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

final class ProductionLeagueRepository: LeagueRepository {
    private let networkService: AthleticNetworkService = AthleticNetworkService()

    func fetchLeagues() async throws -> [League] {
        try await networkService.fetchLeagues()
    }
}
