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
    
    lazy var artistLabel: UILabel = {
        
        let artistLabel = UILabel()
        artistLabel.textColor = .white
        artistLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        return artistLabel
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .blue
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(logoImageView)
        contentView.addSubview(artistLabel)
    }
    func setupLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-50)
            make.left.equalTo(logoImageView.snp.right).offset(20)
            make.bottom.equalTo(self.snp.centerY).offset(-5)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.height.width.equalTo(120)
            make.left.top.bottom.equalToSuperview().inset(10)
        }
        
        artistLabel.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(self.snp.centerY).offset(5)
        }
        
        
    }
    
}

// MARK: - Configure
extension MovieListTableViewCell {
    
    func configure(movie: Movie, selectedIndex: Int) {
        titleLabel.text = movie.title
        logoImageView.image = UIImage(named: "image8")
        artistLabel.text = movie.type
        self.selectedIndex = selectedIndex
        
    }
}
