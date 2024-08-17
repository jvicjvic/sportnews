import UIKit
import Combine


final class ArticlesListViewModel: ObservableObject {
    /// Fetched articles
    @Published private(set) var articles: [Article] = []

    /// Articles filtered
    @Published private(set) var filteredArticles: [Article] = []

    /// VM for the refresh timer counter
    @Published var fetchDateViewModel = FetchDateViewModel()

    /// Article filter string
    @Published var searchText = ""

    @Published var errorMessage = ""

    @Published var isLoading = false

    private let category: ArticleListCategory
    private var selectedLeague: League? = nil
    private var selectedAuthor: Author? = nil
    private var selectedTeam: Team? = nil

    private let repository: ArticleRepository

    var title: String {
        switch category {
        case .all:
            "Articles"
        case .byLeague:
            selectedLeague?.name ?? ""
        case .byAuthor:
            selectedAuthor?.name ?? ""
        case .byTeam:
            selectedTeam?.name ?? ""
        }
    }

    var shouldDisplayLargeTitle: Bool {
        category == .all
    }

    private init(league: League?, author: Author?, team: Team?, category: ArticleListCategory, repository: ArticleRepository = ProductionArticleRepository()) {
        self.selectedLeague = league
        self.selectedAuthor = author
        self.selectedTeam = team
        self.category = category
        self.repository = repository

        setupSearchFilter()
    }

    /// Article list without specifying any category. Default: all articles
    convenience init(repository: ArticleRepository = ProductionArticleRepository()) {
        self.init(league: nil, author: nil, team: nil, category: .all, repository: repository)
    }

    /// Article list for `Leage` category
    convenience init(league: League, repository: ArticleRepository = ProductionArticleRepository()) {
        self.init(league: league, author: nil, team: nil, category: .byLeague, repository: repository)
    }

    /// Article list for `Author` category
    convenience init(author: Author, repository: ArticleRepository = ProductionArticleRepository()) {
        self.init(league: nil, author: author, team: nil, category: .byAuthor, repository: repository)
    }

    /// Article list for `Team` category
    convenience init(team: Team, repository: ArticleRepository = ProductionArticleRepository()) {
        self.init(league: nil, author: nil, team: team, category: .byTeam, repository: repository)
    }

    /// Listen to changes in article list and text filter, apply filter when necessary
    private func setupSearchFilter() {
        Publishers.CombineLatest($searchText, $articles)
            .map { token, articleList in
                articleList.filter { article in
                    token.isEmpty ? true : article.title.contains(token)
                }
            }
            .assign(to: &$filteredArticles)
    }

    @MainActor func fetchArticles() async {
        isLoading = true
        do {
            try await performArticlesFetch()
            isLoading = false
            fetchDateViewModel.didFetch()
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    }

    @MainActor func refresh() async {
        do {
            try await performArticlesFetch()
            fetchDateViewModel.didFetch()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    @MainActor private func performArticlesFetch() async throws {
        switch category {
        case .all:
            articles = try await repository.fetchArticles()

        case .byLeague:
            guard let selectedLeague else { return }
            articles = try await repository.fetchArticles(byLeague: selectedLeague)

        case .byAuthor:
            guard let selectedAuthor else { return }
            articles = try await repository.fetchArticles(byAuthor: selectedAuthor)

        case .byTeam:
            guard let selectedTeam else { return }
            articles = try await repository.fetchArticles(byTeam: selectedTeam)
        }
    }

    func navigationRoute(_ article: Article) -> ArticleRoute {
        ArticleRoute.detail(article)
    }
}

fileprivate enum ArticleListCategory {
    case all
    case byLeague
    case byAuthor
    case byTeam
}

