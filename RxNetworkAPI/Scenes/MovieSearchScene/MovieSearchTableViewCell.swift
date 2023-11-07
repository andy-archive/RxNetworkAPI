//
//  MovieSearchTableViewCell.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import UIKit

import SnapKit
import RxSwift

final class MovieSearchTableViewCell: UITableViewCell {
    
    static let identifier = NSStringFromClass(MovieSearchTableViewCell.self)
    
    lazy var movieRankLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: Constants.FontSize.body)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Color.Label.main
        label.font = .boldSystemFont(ofSize: Constants.FontSize.title)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Color.Label.secondary
        label.font = .systemFont(ofSize: Constants.FontSize.body)
        label.numberOfLines = 1
        return label
    }()
    
    private var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    private func configureLayout() {
        contentView.addSubview(movieRankLabel)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieReleaseDateLabel)
        
        movieRankLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(Constants.Constraint.MovieSearchCell.horitontalConstant)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-Constants.Constraint.MovieSearchCell.verticalConstant)
            $0.leading.equalTo(movieRankLabel.snp.trailing).offset(Constants.Constraint.MovieSearchCell.horitontalConstant)
            $0.trailing.lessThanOrEqualToSuperview().inset(Constants.Constraint.MovieSearchCell.horitontalConstant)
        }
        
        movieReleaseDateLabel.snp.makeConstraints {
            $0.top.equalTo(movieTitleLabel.snp.bottom).offset(Constants.Constraint.MovieSearchCell.verticalConstant)
            $0.leading.equalTo(movieRankLabel.snp.trailing).offset(Constants.Constraint.MovieSearchCell.horitontalConstant)
            $0.trailing.greaterThanOrEqualToSuperview().inset(Constants.Constraint.MovieSearchCell.horitontalConstant)
        }
    }
}
