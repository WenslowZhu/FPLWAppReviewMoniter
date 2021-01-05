//
//  BingImageView.swift
//  Review-app
//
//  Created by Zhu Ting on 2020/10/4.
//  Copyright © 2020 Wenslow. All rights reserved.
//

import SwiftUI

struct BingImageView: View {
    
    @EnvironmentObject var data: StatusData
    
    var body: some View {
        if let imageData = data.imageData, let image = UIImage(data: imageData) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            Text("Down Load Image Fail")
        }
    }
}

struct BingImageView_Previews: PreviewProvider {
    static var previews: some View {
        BingImageView()
            .previewLayout(.fixed(width: 360, height: 169))
    }
}
