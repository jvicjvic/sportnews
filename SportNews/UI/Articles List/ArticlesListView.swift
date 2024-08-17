import SwiftUI

struct ArticlesListView: View {
    @StateObject private var viewModel: ArticlesListViewModel

    init(viewModel: ArticlesListViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        ArticlesListContent(viewModel: viewModel)
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(
                viewModel.shouldDisplayLargeTitle ? .large : .inline
            )
            .searchable(text: $viewModel.searchText)
            .task {
                await viewModel.fetchArticles()
            }
            .refreshable {
                await viewModel.refresh()
            }
    }
}

fileprivate struct ArticlesListContent: View {
    @ObservedObject var viewModel: ArticlesListViewModel
    @State var didScroll = false

    private let fetchRowID = "FetchRowID"

    var body: some View {
        if viewModel.isLoading {
            LoadingView()
        } else {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        // Display fetch time counter on top
                        FetchDateRow(viewModel: viewModel.fetchDateViewModel)
                            .id(fetchRowID)
                            .onDisappear(perform: {
                                didScroll.toggle()
                            })
                            .onAppear(perform: {
                                didScroll.toggle()
                            })

                        ForEach(viewModel.filteredArticles) { article in
                            NavigationLink(value: viewModel.navigationRoute(article)) {
                                ArticleRow(article: article)
                                    .id(article.id)
                            }
                        }
                    }
                }
                .overlay(alignment: .bottomTrailing) {
                    ReturnToTopButton {
                        withAnimation {
                            proxy.scrollTo(fetchRowID)
                        }
                    }
                    .padding([.bottom, .trailing], 16)
                    .opacity(didScroll ? 0.0 : 1.0)
                }
            }
        }
    }
}


#Preview {
    ArticlesListView(viewModel: ArticlesListViewModel())
}
