//
//  Constants+UI.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import UIKit

extension Constants {
    
    enum Color {
        
        enum Label {
            static let main = UIColor.label
            static let secondary = UIColor.secondaryLabel
        }

        enum Background {
            static let main = UIColor.systemBackground
            static let secondary = UIColor.secondarySystemBackground
            static let secondaryGrouped = UIColor.systemGroupedBackground
        }
    }
    
    enum Image {
        
        enum TabBar {
            
            static let movie = UIImage(systemName: "film.stack")
            static let selectedMovie = UIImage(systemName: "film.stack.fill")
        }
    }
}
