import Foundation

fileprivate struct APIEndpoints {
    static let articles = "articles"
    static let leagues = "leagues"
    static let authors = "authors"
    static let teams = "teams"
}

final class AthleticNetworkService {
    private let baseUrl = URL(string: "https://mobile-interview-backend.theathletic.com/")!

    func fetchArticles() async throws -> [Article] {
        let result: [Article] = try await fetch(request: URLRequest(url: baseUrl.appendingPathComponent(APIEndpoints.articles)))
        return result
    }

    func fetchArticles(byLeague leagueId: String) async throws -> [Article] {
        let url = baseUrl.appendingPathComponent(APIEndpoints.leagues)
                            .appendingPathComponent(leagueId)
                            .appendingPathComponent(APIEndpoints.articles)

        return try await fetch(request: URLRequest(url: url))
    }

    func fetchArticles(byAuthor authorId: String) async throws -> [Article] {
        let url = baseUrl.appendingPathComponent(APIEndpoints.authors)
                            .appendingPathComponent(authorId)
                            .appendingPathComponent(APIEndpoints.articles)

        return try await fetch(request: URLRequest(url: url))
    }

    func fetchArticles(byTeam teamId: String) async throws -> [Article] {
        let url = baseUrl.appendingPathComponent(APIEndpoints.teams)
                            .appendingPathComponent(teamId)
                            .appendingPathComponent(APIEndpoints.articles)

        return try await fetch(request: URLRequest(url: url))
    }

    func fetchLeagues() async throws -> [League] {
        try await fetch(request: URLRequest(url: baseUrl.appendingPathComponent(APIEndpoints.leagues)))
    }

    func fetchAuthors() async throws -> [Author] {
        try await fetch(request: URLRequest(url: baseUrl.appendingPathComponent(APIEndpoints.authors)))
    }

    func fetchTeams() async throws -> [Team] {
        try await fetch(request: URLRequest(url: baseUrl.appendingPathComponent(APIEndpoints.teams)))
    }

    private func fetch<T: Decodable>(request: URLRequest) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: request)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try decoder.decode(T.self, from: data)
    }
}
