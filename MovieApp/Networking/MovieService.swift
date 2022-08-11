//
//  MovieService.swift
//  MovieApp
//
//  Created by ProdMac on 10.08.2022.
//

import Moya

enum MovieService {

    case search(title: String)
}

extension MovieService: TargetType {

    var baseURL: URL {
        return URL(string: "http://www.omdbapi.com/")!
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var path: String {
        switch self {
        case .search:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .search:
            return .post
        }
    }

    var sampleData: Data {
        return "".data(using: .utf8)!
    }

    var task: Task {
        switch self {
        case .search(let title):
            return .requestParameters(parameters: ["s": title, "apikey": "df9d0049"], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return nil
    }

}
