//
//  HttpResponseModel.swift
//  MBBWallpaper
//
//  Created by minbaba on 2017/12/18.
//  Copyright © 2017年 minbaba Inc. All rights reserved.
//

import HandyJSON

struct HttpResponseModel: HandyJSON {

    var code:HttpErrorCode = .Success
    var msg = ""
    var data:Any?    
}
