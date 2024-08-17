//
//  ArticleDetail.swift
//  AthleticInterview
//
//  Created by jvic on 25/07/24.
//

import SwiftUI

struct ArticleView: View {
    @StateObject var viewModel: ArticleViewModel

    var body: some View {
        ScrollView {
            AsyncImage(url: viewModel.imageUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    Color.clear
                }
            }

            VStack {
                VStack(alignment: .leading, spacing: 16.0) {
                    Text(viewModel.title)
                        .font(.title).bold()
                    Text(viewModel.textBody)

                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.title)
    }
}

#Preview {
    ArticleView(viewModel: ArticleViewModel.sample())
}
