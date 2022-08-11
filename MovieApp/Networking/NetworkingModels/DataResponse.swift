//
//  DataResponse.swift
//  MovieApp
//
//  Created by ProdMac on 10.08.2022.
//

import Moya

struct DataResponse {

    var response: String
    var movies: [Movie]

}

// MARK: - Codable
extension DataResponse: Codable {

    enum CodingKeys: String, CodingKey {
        case Response
        case Search
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        response = try container.decode(String.self, forKey: .Response)
        movies = try container.decode([Movie].self, forKey: .Search)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(response, forKey: .Response)
        try container.encode(movies, forKey: .Search)
    }

}
