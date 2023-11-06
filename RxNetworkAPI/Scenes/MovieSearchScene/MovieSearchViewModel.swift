//
//  MovieSearchViewModel.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import Foundation

import RxSwift

class MovieSearchViewModel {
    
    var movieItem: [String]
    
    init() {
        movieItem = ["그대들은 어떻게 살 것인가", "소년들", "30일", "톡 투 미", "용감한 시민", "퍼피 구조대: 더 마이티 무비", "블루 자이언트", "플라워 킬링 문", "스즈메의 문단속", "테일러 스위프트 디 에라스 투어"]
    }
    
    func fetchCellData() -> Observable<[String]> {
        return Observable.of(movieItem)
    }
}
