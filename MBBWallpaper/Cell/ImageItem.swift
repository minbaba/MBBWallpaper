//
//  ImageItem.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/1/26.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa
import Kingfisher

class ImageItem: NSCollectionViewItem {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.view.layer = CALayer()
        self.view.layer?.contentsGravity = kCAGravityResizeAspectFill
        self.view.wantsLayer = true
        self.view.layer?.masksToBounds = true
        
        if let representObj = self.representedObject as? String {
            self.imageView?.image = NSImage(named: NSImage.Name(rawValue: representObj))
        }
    }
    
    func updateImage(image: String) {
        
        if image.hasPrefix("file://") {
            self.view.layer?.contents = NSImage(contentsOfFile: image)
        } else {
            ImageDownloader.shared.getImage(for: image, complete: { (path) in
                if let path = path {
                    self.view.layer?.contents = NSImage(contentsOfFile: path)
                }
            })
        }
    }
    
}
