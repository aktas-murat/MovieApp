//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

import Foundation
import UIKit

final class MovieListViewController: UIViewController {
    
    lazy var movieListView: MovieListView = {
        let view = MovieListView()
        view.backgroundColor = .red
        return view
    }()
    
    var moviewListViewModel: MovieListViewModel?
//    var movies: [Movie] = []
    //    var movies: [Movie] = [Movie(title: "String", year: "sssss", imdbID: "String", poster: "String", type: "String")]

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupViewModel()
        moviewListViewModel?.fetchMovies()
     
        
//        movies = moviewListViewModel?.getMovieList() ?? []
        
//        highScoreMovie = moviewListViewModel?.getImdbHighScoreMovie() ?? MovieModel(name: "")
//        openDetail(movie: moviewListViewModel?.getImdbHighScoreMovie())
        //tableView.reloadData()
        

        moviewListViewModel?.searchMovie("fast")
        
    }
    
    func configure() {
        movieListView.tableView.delegate = self
        movieListView.tableView.dataSource = self
        setupViews()
        setupLayot()
    }
    
    func setupViewModel() {
        guard moviewListViewModel == nil else { return }
        moviewListViewModel = MovieListViewModel(movieType: "comedy")
        moviewListViewModel?.delegate = self
    }
    
    func openDetail(movie: Movie?) {
        
    }

}

extension MovieListViewController: MovieListViewModelProtocol {
    func didChangeDataSource() {
        movieListView.tableView.reloadData()
    }
    
    func connectionError() {
//        showErrorAlert()
    }

}

extension MovieListViewController: UITableViewDelegate & UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviewListViewModel?.movies.count ?? 0    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = MovieListTableViewCell(style:.default, reuseIdentifier: "MovieListTableViewCell")
        // UNutma cell.configure() model ver cell içinde set et
        cell.configure(movie:(moviewListViewModel?.movies[indexPath.row])! , selectedIndex: indexPath.row)
//        cell.titleLabel.text = "TEst"
        return cell
//        cell.titleLabel.text = "TEst"
//        return cell
    }
    
    
}

extension MovieListViewController {
    
    func setupViews() {
        self.view.addSubview(movieListView)
    }
    
    func setupLayot() {
        movieListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
