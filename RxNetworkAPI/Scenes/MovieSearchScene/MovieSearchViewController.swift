//
//  MovieSearchViewController.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class MovieSearchViewController: UIViewController {

    private lazy var searchContoller = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "날짜를 입력하세요 (YYYYMMDD)"
        return search
    }()
    
    private lazy var tableView = {
        let view = UITableView()
        view.register(MovieSearchTableViewCell.self, forCellReuseIdentifier: MovieSearchTableViewCell.identifier)
        view.rowHeight = Constants.Constraint.MovieSearchCell.height
        return view
    }()
    
    private let viewModel = MovieSearchViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLayout()
        
        bind()
    }
    
    private func bind() {
        viewModel.fetchCellData()
            .bind(to: tableView.rx.items(cellIdentifier: MovieSearchTableViewCell.identifier, cellType: MovieSearchTableViewCell.self)) { (row, element, cell) in
                cell.movieRankLabel.text = "\(row + 1)위"
                cell.movieTitleLabel.text = element
                cell.movieReleaseDateLabel.text = "\(Date().toString(type: .year))"
            }
            .disposed(by: disposeBag)
    }
    
    private func configure() {
        view.backgroundColor = Constants.Color.Background.main
        
        navigationController?.navigationBar.topItem?.title = "박스오피스 순위"
        
        self.navigationItem.searchController = searchContoller
    }
    
    private func configureLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
