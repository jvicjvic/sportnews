//
//  MockArticleRepository.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import Foundation

final class MockArticleRepository: ArticleRepository {
    var articles = [
        Article(
            id: "1",
            title: "This is a placeholder title for article rows. This is a placeholder article title.",
            imageUrlString:
                "https://cdn.theathletic.com/app/uploads/2023/11/06102929/GettyImages-1763970470-1024x683.jpg",
            body: "This is a test",
            createdAt: Date(),
            updatedAt: Date(),
            deletedAt: nil
        ),
        Article(
            id: "2",
            title: "This is a placeholder title for article rows. This is a placeholder article title.",
            imageUrlString:
                "https://cdn.theathletic.com/app/uploads/2023/11/06102929/GettyImages-1763970470-1024x683.jpg",
            body: "This is a test",
            createdAt: Date(),
            updatedAt: Date(),
            deletedAt: nil
        )
    ]

    func fetchArticles() async throws -> [Article] {
        return [Article]()
    }
    
    func fetchArticles(byLeague league: League) async throws -> [Article] {
        return [Article]()
    }
    
    func fetchArticles(byAuthor author: Author) async throws -> [Article] {
        return [Article]()
    }
    
    func fetchArticles(byTeam team: Team) async throws -> [Article] {
        return [Article]()
    }
}
