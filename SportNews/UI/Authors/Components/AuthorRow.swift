//
//  AuthorRow.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import SwiftUI

struct AuthorRow: View {
    let imageUrl: String
    let name: String
    let title: String

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    Color.clear
                }
            }
            .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(name).font(.headline)
                Text(title)
            }
        }

    }
}

#Preview {
    AuthorRow(imageUrl: "https://cdn.theathletic.com/app/uploads/2019/09/27193448/JH_Pic.jpg", name: "Author Name", title: "Writer")
}
