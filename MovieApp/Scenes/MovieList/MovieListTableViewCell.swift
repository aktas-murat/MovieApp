//
//  MovieListTableViewCell.swift
//  MovieApp
//
//  Created by ProdMac on 10.08.2022.
//

import UIKit

final class MovieListTableViewCell: UITableViewCell {
    
    var selectedIndex: Int?
    
    lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
//        titleLabel.backgroundColor = .yellow
        return titleLabel
        
    }()
    
    lazy var logoImageView: UIImageView = {
        
        let logoImageView = UIImageView()
        return logoImageView
    }()
    
    lazy var movieTypeLabel: UILabel = {
        
        let movieTypeLabel = UILabel()
        movieTypeLabel.textColor = .white
//        movieTypeLabel.backgroundColor = .red
        movieTypeLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        return movieTypeLabel
        
    }()
    
    lazy var movieYearLabel: UILabel = {
        
        let movieYearLabel = UILabel()
        movieYearLabel.textColor = .white
//        movieYearLabel.backgroundColor = .green
        movieYearLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        return movieYearLabel
        
    }()
    lazy var imdbLabel: UILabel = {
        
        let imdbLabel = UILabel()
        imdbLabel.textColor = .white
//        imdbLabel.backgroundColor = .green
        imdbLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        return imdbLabel
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .black
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(logoImageView)
        contentView.addSubview(movieTypeLabel)
        contentView.addSubview(movieYearLabel)
        contentView.addSubview(imdbLabel)
    }
    func setupLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-50)
            make.left.equalTo(logoImageView.snp.right).offset(20)
            make.bottom.equalTo(self.snp.centerY).offset(-20)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.height.width.equalTo(140)
            make.left.top.bottom.equalToSuperview().inset(10)
        }
        
        movieTypeLabel.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(self.snp.centerY).offset(5)
        }
        movieYearLabel.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(self.snp.centerY).offset(20)
            
        }
        imdbLabel.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(movieYearLabel.snp.bottom).offset(5)
            
        }
        
    }
    
}

// MARK: - Configure
extension MovieListTableViewCell {
    

    func configure(movie: Movie, selectedIndex: Int) {
       let url = URL(string: movie.poster)
        titleLabel.text = movie.title
        movieTypeLabel.text = movie.type
        movieYearLabel.text = movie.year
        imdbLabel.text = movie.imdbID
        self.selectedIndex = selectedIndex
        loadimage(urlString: movie.poster)
        
    }
}

extension MovieListTableViewCell {
    
    func loadimage (urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global() .async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.logoImageView.image = image
                    }
                }
            }
                
        }
    }
}
