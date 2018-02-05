//
//  MenuView.swift
//  MBBWallpaper
//
//  Created by 郑敏 on 2018/2/5.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa

class MenuView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        let label = NSTextField(frame: self.bounds)
        self.addSubview(label)
        label.cell?.title = "哈哈哈哈哈哈"
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
