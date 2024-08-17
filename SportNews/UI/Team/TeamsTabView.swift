//
//  TeamsTabView.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import SwiftUI

struct TeamsTabView: View {
    var body: some View {
        NavigationStack {
            TeamsListView(viewModel: TeamsListViewModel())

                .navigationDestination(for: TeamsRoute.self) { route in
                    switch route {
                    case .articlesByTeam(let team):
                        ArticlesListView(viewModel: ArticlesListViewModel(team: team))
                    }
                }

                .navigationDestination(for: ArticleRoute.self) { route in
                    switch route {
                    case .detail(let article):
                        ArticleView(viewModel: ArticleViewModel(article: article))
                    default:
                        ArticlesListView(viewModel: ArticlesListViewModel())
                    }
                }
        }
    }
}

#Preview {
    TeamsTabView()
}
