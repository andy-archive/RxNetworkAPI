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
        return search
    }()
    
    private lazy var tableView = {
        let view = UITableView()
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
    }
    
    private func configureLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
