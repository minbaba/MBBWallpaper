//
//  ImageModel.swift
//  MBBWallpaper
//
//  Created by 郑敏 on 2018/2/23.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa
import HandyJSON

struct ImageModel: HandyJSON {
    
    var pic_class: ImageClasses = .city
    var source: String = ""
    var sourceValid: Bool = false
}
