//
//  CastMember.swift
//  MovieInfo
//
//  Created by Brittany Rima on 6/22/22.
//

import Foundation

struct CastResponse: Codable {
    let cast: [Cast]
}

struct Cast: Codable {
    let id: Int
    let name: String?
    let profilePath: String?
    let character: String?
    let order: Int?
}

extension Cast {
    static let dummyData: [Cast] = [
        Cast(id: 123, name: "Brad Pitt", profilePath: "/cckcYc2v0yh1tc9QjRelptcOBko.jpg", character: "Person1", order: 1)
    ]
}
