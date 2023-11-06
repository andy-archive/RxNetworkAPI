//
//  Extension+DateFormat.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import UIKit

enum DateFormatType {
    case year
    
    var description: String {
        switch self {
        case .year:
            return "yyyy-MM-dd"
        }
    }
}

extension Date {
    
    func toString(type: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = type.description
        return dateFormatter.string(from: self)
    }
}

extension String {
    
    func toDate(type: DateFormatType) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = type.description
        return dateFormatter.date(from: self)
    }
}

