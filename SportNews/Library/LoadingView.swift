//
//  LoadingView.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Loading...").foregroundColor(.gray)
            ProgressView()
        }
    }
}

#Preview {
    LoadingView()
}
