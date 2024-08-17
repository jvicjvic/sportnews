//
//  ProductionArticleRepository.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

final class ProductionArticleRepository: ArticleRepository {
    private let networkService: AthleticNetworkService = AthleticNetworkService()

    func fetchArticles() async throws -> [Article] {
        try await networkService.fetchArticles()
    }

    func fetchArticles(byLeague league: League) async throws -> [Article] {
        try await networkService.fetchArticles(byLeague: league.id)
    }

    func fetchArticles(byAuthor author: Author) async throws -> [Article] {
        try await networkService.fetchArticles(byAuthor: author.id)
    }

    func fetchArticles(byTeam team: Team) async throws -> [Article] {
        try await networkService.fetchArticles(byTeam: team.id)
    }
}
