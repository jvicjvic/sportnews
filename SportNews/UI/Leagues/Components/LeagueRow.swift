//
//  LeagueRow.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import SwiftUI

struct LeagueRow: View {
    var league: League

    var body: some View {
        VStack {
            HStack {
                Text(league.name)
                    .foregroundStyle(.black)
                    .padding()
                Spacer()
            }
            .frame(height: 50)
            Divider()
        }

    }
}
