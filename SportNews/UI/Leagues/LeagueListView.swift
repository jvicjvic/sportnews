//
//  LeagueListView.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import SwiftUI

struct LeagueListView: View {
    @StateObject var viewModel: LeagueListViewModel

    var body: some View {
        LeagueListContent(viewModel: viewModel)
            .searchable(text: $viewModel.searchText)
            .task {
                await viewModel.fetchLeagues()
            }
            .navigationTitle(viewModel.title)
            .listStyle(.plain)

    }
}

fileprivate struct LeagueListContent: View {
    @ObservedObject var viewModel: LeagueListViewModel

    var body: some View {
        if viewModel.isLoading {
            LoadingView()
        } else {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.filteredLeagues) { league in
                        NavigationLink(value: viewModel.navigationRoute(for: league)) {
                            LeagueRow(league: league)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    LeagueListView(viewModel: LeagueListViewModel.sample())
}
