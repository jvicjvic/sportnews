//
//  AuthorRepository.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

protocol AuthorRepository {
    func fetchAuthors() async throws -> [Author]
}

