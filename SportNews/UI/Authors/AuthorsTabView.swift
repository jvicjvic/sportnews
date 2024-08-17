//
//  AuthorsTabView.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import SwiftUI

struct AuthorsTabView: View {
    var body: some View {
        NavigationStack {
            AuthorsListView(viewModel: AuthorsListViewModel())

                .navigationDestination(for: AuthorsRoute.self) { route in
                    switch route {
                    case .articlesByAuthor(let author):
                        ArticlesListView(viewModel: ArticlesListViewModel(author: author))
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
    AuthorsTabView()
}
