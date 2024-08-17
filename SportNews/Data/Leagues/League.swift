//
//  League.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

struct League: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let sportType: String
}
