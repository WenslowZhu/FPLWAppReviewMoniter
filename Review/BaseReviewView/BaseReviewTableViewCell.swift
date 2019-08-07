//
//  BaseReviewTableViewCell.swift
//  Review
//
//  Created by Wenslow on 2019/1/4.
//  Copyright © 2019 Wenslow. All rights reserved.
//

import UIKit
import Cosmos
import AppStoreReviewService
import ReviewUIKit

class BaseReviewTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = Labels.h1Label()
    lazy var ratingView: RatingView = RatingView.quickInit()
    lazy var nameLabel: UILabel = Labels.grayH2Label()
    lazy var contentLabel: UILabel = {
        let label = Labels.h2Label()
        label.numberOfLines = 0
        return label
    }()
    lazy var reviewCardView: UIView = Views.cardContentView()
    
    private let viewMargin: CGFloat = 25
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.addSubview(reviewCardView)
        reviewCardView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(viewMargin)
            make.top.bottom.equalToSuperview().inset(15)
        }
        
        reviewCardView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(15)
        }
        
        reviewCardView.addSubview(ratingView)
        ratingView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.left.equalTo(titleLabel)
            make.size.equalTo(CGSize(width: 129, height: 24))
        }
        
        reviewCardView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(ratingView)
            make.right.equalTo(titleLabel)
            make.left.equalTo(ratingView.snp.right).inset(10)
        }
        
        reviewCardView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ratingView.snp.bottom).inset(-15)
            make.left.bottom.right.equalToSuperview().inset(15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(reviewModel: ReviewModel) {
        titleLabel.text = reviewModel.title
        nameLabel.text = reviewModel.author
        ratingView.rating = reviewModel.rating
        contentLabel.text = reviewModel.content
    }
}
