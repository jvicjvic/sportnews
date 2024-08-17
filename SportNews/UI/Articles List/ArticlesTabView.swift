//
//  ArticlesTabView.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import SwiftUI

struct ArticlesTabView: View {
    var body: some View {
        NavigationStack {
            ArticlesListView(viewModel: ArticlesListViewModel())
                .navigationDestination(for: ArticleRoute.self) {  route in
                    switch route {
                    case .list:
                        ArticlesListView(viewModel: ArticlesListViewModel())
                    case .detail(let article):
                        ArticleView(viewModel: ArticleViewModel(article: article))
                    }
                }
        }
    }
}

#Preview {
    ArticlesTabView()
}
