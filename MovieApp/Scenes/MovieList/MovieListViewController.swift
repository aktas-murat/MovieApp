//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

import Foundation
import UIKit

final class MovieListViewController: UIViewController {
    

    
    var moviewListViewModel: MovieListViewModel?
    var movieList: [MovieModel] = []
    var highScoreMovie: MovieModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        moviewListViewModel?.fetchMovies()
        
        movieList = moviewListViewModel?.getMovieList() ?? []
        
//        highScoreMovie = moviewListViewModel?.getImdbHighScoreMovie() ?? MovieModel(name: "")
        openDetail(movie: moviewListViewModel?.getImdbHighScoreMovie())
        //tableView.reloadData()
    }
    
    func setupViewModel() {
        guard moviewListViewModel == nil else { return }
        moviewListViewModel = MovieListViewModel(movieType: "comedy")
        moviewListViewModel?.delegate = self
    }
    
    func openDetail(movie: MovieModel?) {
        
    }

}

extension MovieListViewController: MovieListViewModelProtocol {
    func didChangeDataSource() {
//        reloadData()
    }
    
    func connectionError() {
//        showErrorAlert()
    }

}
