//
//  MovieSearchViewController.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import UIKit

import SnapKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLayout()
    }
    
    private func configure() {
        view.backgroundColor = Constants.Color.Background.main
        
        navigationController?.navigationBar.topItem?.title = "영화 검색"
        
        self.navigationItem.searchController = searchContoller
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MovieSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieSearchTableViewCell.identifier, for: indexPath) as? MovieSearchTableViewCell else { return UITableViewCell() }
        return cell
    }
}
