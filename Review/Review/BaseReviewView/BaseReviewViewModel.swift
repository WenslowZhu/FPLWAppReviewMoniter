//
//  ReviewViewModel.swift
//  Review
//
//  Created by Wenslow on 2019/1/2.
//  Copyright © 2019 Wenslow. All rights reserved.
//

import RxSwift

protocol BaseReviewViewable {
    func fetchReviewData() -> Observable<[EntryModel]>
}

class BaseReviewViewModel: BaseReviewViewable {
    
    let appID: String
    let reviewService: ReviewServiceLayer
    let disposeBag = DisposeBag()
    
    var reviewEntryModels = [EntryModel]()
    
    init(appID: String,
         reviewService: ReviewServiceLayer = ReviewService()) {
        self.appID = appID
        self.reviewService = reviewService
    }
    
    func fetchReviewData() -> Observable<[EntryModel]> {
        var observerList = [Observable<[EntryModel]>]()
        
        for i in 1...3 {
            observerList.append(reviewService.fetchReviewData(appID: appID, page: i))
        }
        
        return Observable.zip(observerList)
            .map { (result) -> [EntryModel] in
                var entryModels = [EntryModel]()
                result.forEach { entryModels.append(contentsOf: $0) }
                return entryModels
            }
    }
}