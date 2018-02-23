//
//  ImageDownloader.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/2/9.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa
import Kingfisher

class ImageDownloader: NSObject {
    
    public static let shared = ImageDownloader()
    
    private override init() {
        self.cache = ImageCache.init(name: "MBBWallpaper", path: path, diskCachePathClosure: { (path, cacheName) -> String in
            return (path! as NSString).appendingPathComponent("Wallpaper")
        })
    }
    
    let path = NSSearchPathForDirectoriesInDomains(.picturesDirectory, .userDomainMask, true).last
    private var cache: ImageCache
    static let cacheKey = "wallpaper"
    
    /// 下载图片并存储
    ///
    /// - Parameters:
    ///   - urlString: 下载地址
    ///   - complete: 下载完成的回调，参数为图片存储地址，下载失败时为nil
    func getImage(for urlString: String, complete:((_ imagePath: String?) -> Void)? = nil) {
        
        guard let url = URL(string: urlString) else {
            complete?(nil)
            return
        }
        
        // 判断图片是否存在
        
        if self.cache.imageCachedType(forKey: urlString, processorIdentifier: ImageDownloader.cacheKey) != .none {
            complete?(self.cache.cachePath(forKey: urlString, processorIdentifier: ImageDownloader.cacheKey))
            return
        }
        
        KingfisherManager.shared.downloader.downloadImage(with: url) { (image, error, _, _) in
            if let _ = error {
                print(error ?? "")
                complete?(nil)
            } else {
                // 存储
                self.cache.store(image!,
                                 forKey: urlString,
                                 processorIdentifier: ImageDownloader.cacheKey,
                                 toDisk: true,
                                 completionHandler: {
                                    complete?(self.cache.cachePath(forKey: urlString, processorIdentifier: ImageDownloader.cacheKey))
                })
            }
        }
    }
}
