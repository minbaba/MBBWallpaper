//
//  ImageItem.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/1/26.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa

class ImageItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        if let representObj = self.representedObject as? String {
            self.imageView?.image = NSImage(named: NSImage.Name(rawValue: representObj))
        }
    }
    
}
