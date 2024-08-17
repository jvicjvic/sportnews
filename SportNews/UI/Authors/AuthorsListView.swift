//
//  AuthorsListView.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import SwiftUI

struct AuthorsListView: View {
    @StateObject var viewModel: AuthorsListViewModel

    var body: some View {
        List {
            ForEach(viewModel.filteredAuthors) { author in
                NavigationLink(value: viewModel.navigationRoute(for: author)) {
                    AuthorRow(imageUrl: author.imageUrlString, name: author.name, title: author.title)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .task {
            await viewModel.fetchAuthors()
        }
        .navigationTitle(viewModel.title)
        .listStyle(.plain)
    }
}

#Preview {
    AuthorsListView(viewModel: AuthorsListViewModel.sample())
}
