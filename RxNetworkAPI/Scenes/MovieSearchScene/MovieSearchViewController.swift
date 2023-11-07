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
    
    private lazy var items = PublishSubject<[DailyBoxOfficeList]>()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureLayout()
        
        bind()
    }
    
    private func bind() {
        searchContoller.searchBar
            .rx
            .searchButtonClicked
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(searchContoller.searchBar.rx.text.orEmpty, resultSelector: { _, query in
                guard query.count == 8, let _ = Int(query) else { return "20231101" }
                return query
            })
            .flatMap { query in
                BoxOfficeAPIManager.fetchData(date: query)
            }
            .subscribe(with: self, onNext: { owner, result in
                let data = result.boxOfficeResult.dailyBoxOfficeList
                owner.items.onNext(data)
            })
            .disposed(by: disposeBag)
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: MovieSearchTableViewCell.identifier, cellType: MovieSearchTableViewCell.self)) { (row, element, cell) in
                cell.movieRankLabel.text = "\(element.rank)위"
                cell.movieTitleLabel.text = element.movieNm
                cell.movieReleaseDateLabel.text = "개봉일: \(element.openDt)"
            }
            .disposed(by: disposeBag)
        
        let request = BoxOfficeAPIManager
            .fetchData(date: "20231105")
            .asDriver(onErrorJustReturn: DailyBoxOfficeModel(boxOfficeResult: BoxOfficeResult(boxofficeType: "일별 박스오피스", showRange: "20000101~20000101", dailyBoxOfficeList: [])))
        
        request
            .drive(with: self) { owner, result in
                owner.items.onNext(result.boxOfficeResult.dailyBoxOfficeList)
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
