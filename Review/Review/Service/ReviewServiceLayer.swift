//
//  ReviewServiceLayer.swift
//  Review
//
//  Created by Wenslow on 2019/1/4.
//  Copyright © 2019 Wenslow. All rights reserved.
//

import RxSwift

protocol ReviewServiceLayer {
    func fetchReviewData(appID: String, page: Int) -> Observable<[EntryModel]>
}
