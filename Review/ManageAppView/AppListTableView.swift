//
//  AppListTableView.swift
//  Review
//
//  Created by Wenslow on 2019/1/11.
//  Copyright © 2019 Wenslow. All rights reserved.
//

import UIKit

class AppListTableView: UITableView {
    override func awakeFromNib() {
        super.awakeFromNib()
        tableFooterView = UIView()
    }
}
