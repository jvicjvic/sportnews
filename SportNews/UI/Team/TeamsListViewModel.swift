//
//  TeamsListViewModel.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import Foundation
import Combine

final class TeamsListViewModel: ObservableObject {
    private let repository: TeamRepository

    @Published private(set) var teams = [Team]()
    @Published private(set) var filteredTeams = [Team]()
    @Published var searchText = ""
    @Published var errorMessage = ""

    let title = "Articles by Teams"

    init(repository: TeamRepository = ProductionTeamRepository()) {
        self.repository = repository
        setupSearchFilter()
    }

    private func setupSearchFilter() {
        Publishers.CombineLatest($searchText, $teams)
            .map { token, teamList in
                teamList.filter { team in
                    token.isEmpty ? true : team.name.contains(token)
                }
            }
            .assign(to: &$filteredTeams)
    }

    @MainActor func fetchTeams() async {
        do {
            teams = try await repository.fetchTeams()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func navigationRoute(for team: Team) -> TeamsRoute {
        TeamsRoute.articlesByTeam(team)
    }

    static func sample() -> TeamsListViewModel {
        TeamsListViewModel()
    }
}

