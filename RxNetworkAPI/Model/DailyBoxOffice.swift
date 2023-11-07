//
//  DailyBoxOffice.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import Foundation

struct DailyBoxOfficeModel: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let rank, movieNm, openDt: String
    
    enum CodingKeys: String, CodingKey {
        case rank, movieNm, openDt
    }
}
