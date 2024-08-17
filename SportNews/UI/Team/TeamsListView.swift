//
//  TeamsListView.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import SwiftUI

struct TeamsListView: View {
    @StateObject var viewModel: TeamsListViewModel

    var body: some View {
        List {
            ForEach(viewModel.filteredTeams) { team in
                NavigationLink(value: viewModel.navigationRoute(for: team)) {
                    Text(team.name)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .task {
            await viewModel.fetchTeams()
        }
        .navigationTitle(viewModel.title)
        .listStyle(.plain)
    }
}

#Preview {
    TeamsListView(viewModel: TeamsListViewModel.sample())
}
