//
//  Author.swift
//  AthleticInterview
//
//  Created by jvic on 27/07/24.
//

import Foundation

struct Author: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let imageUrlString: String
    let name: String
    let shortname: String

    static func sample() -> Author {
        Author(
            id: "CD14297E-ABC0-47B5-AEF7-77803E0BCE36",
            title: "Senior Writer, MLB",
            imageUrlString:
                "https://cdn.theathletic.com/app/uploads/2019/09/27193448/JH_Pic.jpg",
            name: "Ken Rosenthal",
            shortname: "K. Rosenthal"
        )
    }
}
