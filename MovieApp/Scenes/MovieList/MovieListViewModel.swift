//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

import Foundation

protocol MovieListViewModelProtocol: NSObject {
    
    func didChangeDataSource()
    
    func connectionError()
}

class MovieListViewModel {
    
    weak var delegate: MovieListViewModelProtocol?
    
    var movieType: String?
    var movies: [MovieModel] = []
    
    init(movieType: String?) {
        self.movieType = movieType
    }
    
    func fetchMovies() {
//        API.request
//        if success {
//        movies = response.movies
//            delegate?.didChangeDataSource()
//        } else if error {
//            delegate?.connectionError()
//        }
    }
    
    func getMovieList() -> [MovieModel] {
        
//        API.request(movieType). {
//
//        }
//        movies = blabla
        
        return movies
    }
    
    func getImdbHighScoreMovie() -> MovieModel {
//        movies.filter { <#MovieModel#> in
//            <#code#>
//        }
        return MovieModel(name: "Test")
    }
}
