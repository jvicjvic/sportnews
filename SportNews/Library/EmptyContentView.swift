//
//  EmptyContentView.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import SwiftUI

struct EmptyContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Nothing to see yet").foregroundColor(.gray)
        }
    }
}

#Preview {
    EmptyContentView()
}
