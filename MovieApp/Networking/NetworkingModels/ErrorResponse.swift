//
//  ErrorResponse.swift
//  MovieApp
//
//  Created by ProdMac on 10.08.2022.
//

import Moya

struct ErrorResponse {

    var response: String
    var error: String

}

// MARK: - Codable
extension ErrorResponse: Codable {

    enum CodingKeys: String, CodingKey {
        case Response
        case Error
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        response = try container.decode(String.self, forKey: .Response)
        error = try container.decode(String.self, forKey: .Error)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(response, forKey: .Response)
        try container.encode(error, forKey: .Error)
    }

}
