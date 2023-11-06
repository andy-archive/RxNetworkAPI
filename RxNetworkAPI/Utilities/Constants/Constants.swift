//
//  Constants.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import Foundation

enum Constants {
    
    enum Text {
        
        enum TabBar {
            static let movieTitle = "MOVIE"
        }
        
        enum Address {
            static let dailyBoxOffice =  "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
        }
    }
    
    enum FontSize {
        static let title: CGFloat = 18
        static let subtitle: CGFloat = 15
        static let body: CGFloat = 12
    }
    
    enum Constraint {
        
        enum MovieSearchCell {
            static let horitontalConstant = 20
            static let verticalConstant = 8
            static let height: CGFloat = 100
        }
    }
}
