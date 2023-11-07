//
//  BoxOfficeAPIManager.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import Foundation

import RxSwift
import RxCocoa

class BoxOfficeAPIManager {
    
    static func fetchData(date: String) -> Observable<DailyBoxOfficeModel> {
        
        return Observable<DailyBoxOfficeModel>.create { value in
            
            let urlString = Constants.Text.Address.dailyBoxOffice
            
            var urlComponents = URLComponents(string: urlString)
            
            let keyQuery = URLQueryItem(name: "key", value: "\(Constants.APIKey.kobis)")
            let dateQuery = URLQueryItem(name: "targetDt", value: "\(date)")
            
            urlComponents?.queryItems?.append(keyQuery)
            urlComponents?.queryItems?.append(dateQuery)
            
            guard let url = urlComponents?.url else {
                value.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let _ = error {
                    value.onError(APIError.unknown)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    value.onError(APIError.statusError)
                    return
                }
                
                if let data {
                    do {
                        let dailyBoxOfficeData = try JSONDecoder().decode(DailyBoxOfficeModel.self, from: data)
                        value.onNext(dailyBoxOfficeData)
                    }
                    catch {
                        value.onError(APIError.decodeError)
                        return
                    }
                }
            }
            
            task.resume()
            
            return Disposables.create()
        }
    }
}
