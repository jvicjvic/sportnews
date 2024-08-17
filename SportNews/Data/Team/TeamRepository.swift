//
//  TeamRepository.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import Foundation

protocol TeamRepository {
    func fetchTeams() async throws -> [Team]
}
