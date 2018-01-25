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
        
//        self.registerForDraggedTypes(<#T##newTypes: [NSPasteboard.PasteboardType]##[NSPasteboard.PasteboardType]#>)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        
        guard let types = sender.draggingPasteboard().types else {
            return NSDragOperation.
        }
        
        if types.contains(NSPasteboard.PasteboardType.fileNameType(forPathExtension: "gif")) {
            return .copy
        }
        return .none
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
