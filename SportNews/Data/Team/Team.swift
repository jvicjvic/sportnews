//
//  Team.swift
//  AthleticInterview
//
//  Created by jvic on 28/07/24.
//

import Foundation

struct Team: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let shortname: String

    static func sample() -> Team {
        Team(
            id: "CD14297E-ABC0-47B5-AEF7-77803E0BCE36",
            name: "Wildcats",
            shortname: "ARIZ"
        )
    }
}
