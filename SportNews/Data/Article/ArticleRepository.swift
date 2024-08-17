//
//  ArticleRepository.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

protocol ArticleRepository {
    func fetchArticles() async throws -> [Article]
    func fetchArticles(byLeague league: League) async throws -> [Article]
    func fetchArticles(byAuthor author: Author) async throws -> [Article]
    func fetchArticles(byTeam team: Team) async throws -> [Article]
}
