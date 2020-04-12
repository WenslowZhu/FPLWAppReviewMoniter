//
//  ReviewService.swift
//  Review
//
//  Created by Wenslow on 2019/1/4.
//  Copyright © 2019 Wenslow. All rights reserved.
//

import RxSwift
import Alamofire
import ReviewHelperKit

public protocol ReviewAPILayer {
    func fetchReviewData(appID: String, page: Int, country: Country) -> Observable<[ReviewResponse]>
}

class ReviewAPIService: ReviewAPILayer {
    
    let baseURL = "https://itunes.apple.com/rss/customerreviews/page=%d/id=%@/sortby=mostrecent/json?l=en&&cc=%@"
    
    func fetchReviewData(appID: String, page: Int, country: Country) -> Observable<[ReviewResponse]> {
        
        let urlString: String
        
        if let encodingString = String(format: baseURL, page, appID, country.rawValue).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString = encodingString
        } else {
            urlString = ""
        }
//        print(urlString)
        return Observable<[ReviewResponse]>.create({ (observer) -> Disposable in
            AF.request(urlString).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let value = try JSONDecoder().decode(ReviewSearchResult.self, from: data)
                        observer.onNext(value.feed.entrys)
                    } catch {
                        observer.onNext([])
                        print(error)
                    }
                case .failure(_):
                    observer.onNext([])
                }
            }
            return Disposables.create()
        })
    }
}
