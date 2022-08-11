//
//  MovieModel.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

import Foundation
import Moya

struct Movie {

    var title: String
    var year: String
    var imdbID: String
    var poster: String
    var type: String

}

// MARK: - Codable
extension Movie: Codable {

    enum CodingKeys: String, CodingKey {
        case Title
        case Year
        case imdbID
        case Poster
        case `Type`
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        imdbID = try container.decode(String.self, forKey: .imdbID)
        title = try container.decode(String.self, forKey: .Title)
        year = try container.decode(String.self, forKey: .Year)
        poster = try container.decode(String.self, forKey: .Poster)
        type = try container.decode(String.self, forKey: .Type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(imdbID, forKey: .imdbID)
        try container.encode(title, forKey: .Title)
        try container.encode(year, forKey: .Year)
        try container.encode(poster, forKey: .Poster)
        try container.encode(type, forKey: .Type)
    }

}

// MARK: - Equatable
extension Movie: Equatable {

    public static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.imdbID == rhs.imdbID
    }

}
