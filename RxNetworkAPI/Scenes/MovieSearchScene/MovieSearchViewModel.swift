//
//  MovieSearchViewModel.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import Foundation

import RxSwift
import RxCocoa

class MovieSearchViewModel {
    
    var dailyBoxOfficeList = PublishSubject<[DailyBoxOfficeList]>()
    
    var data: [DailyBoxOfficeList]
    
    init() {
        self.data = []
    }
}
