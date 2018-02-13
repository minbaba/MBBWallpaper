//
//  HttpManager.swift
//  MBBWallpaper
//
//  Created by minbaba on 2017/10/13.
//  Copyright © 2017年 minbaba Inc. All rights reserved.
//

import RxSwift
import Alamofire
import HandyJSON

let errorDomain = "com.minbaba.wallpaper.network"

enum HttpError: Error {
    // 服务器数据报错,前端展示文本
    case dataError(String)
    
    // 服务器接口报错
    case serverError
    
    // 网络连接报错
    case netWorkError
}

class HttpManager: NSObject {
    
    class func request(url: HttpUrl, params:[String: Any]? = nil, method: HTTPMethod = .get) -> Observable<HttpResponseModel> {
        return Observable<HttpResponseModel>.create { (observer) -> Disposable in
            
            let request = Alamofire.request(url.completeUrl, method: method, parameters: params).responseString(completionHandler: { (response) in
                switch response.result {
                    case let .failure(error):
                        observer.onError(error)
                    
                    case let .success(result):
                        
                        if let responseModel = parseResponseModel(result: result) {
                            observer.onNext(responseModel)
                            observer.onCompleted()
                        } else {
                            observer.onError(NSError(domain: errorDomain, code: 1, userInfo: nil))
                        }
                }
            })
            
            // 释放
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    private class func parseResponseModel(result: String) -> HttpResponseModel? {
        return HttpResponseModel.deserialize(from: result)
    }
}
