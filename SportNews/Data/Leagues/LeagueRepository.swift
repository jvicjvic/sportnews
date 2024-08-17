//
//  LeagueRepository.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

protocol LeagueRepository {
    func fetchLeagues() async throws -> [League]
}
