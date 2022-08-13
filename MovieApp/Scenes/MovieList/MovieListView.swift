//
//  MovieListView.swift
//  MovieApp
//
//  Created by ProdMac on 6.08.2022.
//

import UIKit

final class MovieListView: UIView {
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.backgroundColor = .black
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupLayot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(tableView)
    }
    
    
    func setupLayot() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
