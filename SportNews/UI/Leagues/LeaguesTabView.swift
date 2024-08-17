//
//  LeaguesTabView.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import SwiftUI

struct LeaguesTabView: View {
    var body: some View {
        NavigationStack {
            LeagueListView(viewModel: LeagueListViewModel())
                
                .navigationDestination(for: LeagueRoute.self) { route in
                    switch route {
                    case .articlesByLeague(let league):
                        ArticlesListView(viewModel: ArticlesListViewModel(league: league))
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
    LeaguesTabView()
}
