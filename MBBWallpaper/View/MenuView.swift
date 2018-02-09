//
//  MenuView.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/2/5.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa

class MenuView: NSView {
    
    @IBOutlet var view: NSView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var thumbnailView: NSImageView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
