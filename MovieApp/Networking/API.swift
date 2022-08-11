//
//  API.swift
//  MovieApp
//
//  Created by ProdMac on 10.08.2022.
//

import Moya

final class API {
    static let movieProvider = MoyaProvider<MovieService>()
}
