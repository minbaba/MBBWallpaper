//
//  DragView.swift
//  MBBWallpaper
//
//  Created by 郑敏 on 2018/1/22.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa

class DragView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.registerForDraggedTypes([NSPasteboard.PasteboardType("NSFilenamesPboardType")])
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        
        guard let types = sender.draggingPasteboard().types else {
            return NSDragOperation.init(rawValue: 0)
        }
        
        if types.contains(NSPasteboard.PasteboardType("NSFilenamesPboardType")) {
            return .copy
        }
        return NSDragOperation.init(rawValue: 0)
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        
        let pasteboard = sender.draggingPasteboard()
        let list = pasteboard.propertyList(forType: NSPasteboard.PasteboardType("NSFilenamesPboardType"))
        
        print(list)
        
        return true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
