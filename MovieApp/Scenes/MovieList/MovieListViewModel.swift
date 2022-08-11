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
    var movies: [Movie] = []
    
    init(movieType: String?) {
        self.movieType = movieType
    }
    
    func searchMovie(_ text: String) {
        API.movieProvider.request(.search(title: text)) { [weak self] result in
            
            guard let self = self else { return }
            
            //                    self.layoutableView.setLoading(false)
            
            switch result {
            case .failure(let error):
                print("failure API")
                //                        Alert(errorMessage: error.localizedDescription).show()
                
            case .success(let response):
                
                if let errorData = try? response.map(ErrorResponse.self) {
                    //                            Alert(errorMessage: errorData.error).show()
                    return
                }
                guard let data = try? response.map(DataResponse.self) else {
                    //                            Alert(errorMessage: "Movie not found!").show()
                    return
                }
                guard data.response != "False" else {
                    //                            Alert(errorMessage: "Movie not found!").show()
                    return
                }
                guard data.movies.count > 0 else {
                    //                            Alert(errorMessage: "Movie not found!").show()
                    return
                }
                print("Data Test:")
                print(data.movies)
                self.movies.append(contentsOf: data.movies)
                self.delegate?.didChangeDataSource()
                //                        self.movies = data.movies
                //                        self.layoutableView.endEditing(true)
                //                        self.layoutableView.tableView.reloadData()
            }
        }
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
    
    func getMovieList() -> [Movie] {
        
//        API.request(movieType). {
//
//        }
//        movies = blabla
        
        return movies
    }
    
//    func getImdbHighScoreMovie() -> Movie {
//        movies.filter { <#MovieModel#> in
//            <#code#>
//        }
//        return Movie(title: "aaa", year: "1111", imdbID: "2", poster: "image8", type: "ssss")
//    }
}

