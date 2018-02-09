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

    class func getImage(for urlString: String, complete:((_ image: NSImage?) -> Void)? = nil) {
        
        guard let url = URL(string: urlString) else {
            complete?(nil)
            return
        }
        
        KingfisherManager.shared.downloader.downloadImage(with: url) { (image, error, _, _) in
            if let _ = error {
                print(error ?? "")
                complete?(nil)
            } else {
                print("\ndownload success:\n" + urlString + "\npath:" + KingfisherManager.shared.cache.cachePath(forKey: urlString))
                
                complete?(image)
            }
        }
    }
}
