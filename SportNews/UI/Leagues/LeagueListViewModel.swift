//
//  LeagueListViewModel.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation
import Combine

final class LeagueListViewModel: ObservableObject {
    private let repository: LeagueRepository

    @Published private(set) var leagues = [League]()
    @Published private(set) var filteredLeagues = [League]()
    @Published var searchText = ""
    @Published var errorMessage = ""
    @Published var isLoading = false

    let title = "Leagues"

    init(repository: LeagueRepository = ProductionLeagueRepository()) {
        self.repository = repository
        setupSearchFilter()
    }

    private func setupSearchFilter() {
        Publishers.CombineLatest($searchText, $leagues)
            .map { token, leagueList in
                leagueList.filter { league in
                    token.isEmpty ? true : league.name.contains(token)
                }
            }
            .assign(to: &$filteredLeagues)
    }

    @MainActor func fetchLeagues() async {
        isLoading = leagues.isEmpty
        do {
            leagues = try await repository.fetchLeagues()
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    }

    func navigationRoute(for league: League) -> LeagueRoute {
        LeagueRoute.articlesByLeague(league)
    }

    static func sample() -> LeagueListViewModel {
        LeagueListViewModel()
    }
}
