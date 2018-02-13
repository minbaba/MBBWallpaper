//
//  HttpUrl.swift
//  MBBWallpaper
//
//  Created by minbaba on 2017/10/13.
//  Copyright © 2017年 minbaba Inc. All rights reserved.
//

protocol HttpUrl {
    var completeUrl: String { get }
}
extension HttpUrl {

    static var httpUri: String {
        #if DEBUG
            return "http://127.0.0.1:8000"
        #else
            return "http://wallpaper.minbaba.cn"
        #endif
    }
}

enum StaticHttpUrl: String, HttpUrl {
    
    case feedList = "/feedList"
    
    var completeUrl: String {
        return StaticHttpUrl.httpUri + self.rawValue
    }
}

enum ParamHttpUrl: HttpUrl {
    
    case stationList(String)
    
    var path: String {
        switch self {
        case .stationList(let code):
            return "/cities/\(code)/areas/stations"
        default:
            return ""
        }
    }
    
    var completeUrl: String {
        return ParamHttpUrl.httpUri + self.path
    }
    
}




