//
//  AuthorsListViewModel.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation
import Combine

final class AuthorsListViewModel: ObservableObject {
    private let repository: AuthorRepository

    @Published private(set) var authors = [Author]()
    @Published private(set) var filteredAuthors = [Author]()
    @Published var searchText = ""
    @Published var errorMessage = ""

    let title = "Authors"

    init(repository: AuthorRepository = ProductionAuthorRepository()) {
        self.repository = repository
        setupSearchFilter()
    }

    private func setupSearchFilter() {
        Publishers.CombineLatest($searchText, $authors)
            .map { token, leagueList in
                leagueList.filter { league in
                    token.isEmpty ? true : league.name.contains(token)
                }
            }
            .assign(to: &$filteredAuthors)
    }

    @MainActor func fetchAuthors() async {
        do {
            authors = try await repository.fetchAuthors()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func navigationRoute(for author: Author) -> AuthorsRoute {
        AuthorsRoute.articlesByAuthor(author)
    }

    static func sample() -> AuthorsListViewModel {
        AuthorsListViewModel()
    }
}

