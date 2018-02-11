//
//  ViewController.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/1/19.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa
import AppKit

class ViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource, DragViewDelegate {
    

    @IBOutlet weak var collection: NSCollectionView!
    @IBOutlet weak var dragView: DragView!
    
    var statusItem: NSStatusItem!
    var imagesList: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection.register(NSNib(nibNamed: NSNib.Name(rawValue: "ImageItem"), bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier("cell"))
        
        let layout = NSCollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 60)
        layout.sectionInset = NSEdgeInsetsMake(10, 10, 10, 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        self.collection.collectionViewLayout = layout
        
        dragView.delegate = self
        
        self.constructStatusItem()
    }
    
    override func viewDidLayout() {
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        if let list = self.imagesList {
            return list.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("cell"), for: indexPath) as! ImageItem
        item.updateImage(image: NSImage(contentsOfFile: self.imagesList![indexPath.item]))
        return item
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {

        guard let indexPath = indexPaths.first else {
            return
        }
        guard let imagePath = self.imagesList?[indexPath.item] else {
            return
        }
        
        ImageDownloader.getImage(for: "https://c1.staticflickr.com/6/5572/14689720998_d154c4019f_h.jpg") { (path) in
            if let path = path {
                self.updateWallpapaer(path: "file://" + path)
            }
        }
//        let url = URL(string: "https://c1.staticflickr.com/6/5572/14689720998_d154c4019f_h.jpg")!
    }
    
    func updateWallpapaer(path: String) {
        let url = NSURL.fileURL(withPath:path)
        let sws = NSWorkspace.shared
        for screen in NSScreen.screens {
            guard let opt = sws.desktopImageOptions(for: screen) else {
                continue
            }
            
            do {
                try sws.setDesktopImageURL(url, for: screen, options: opt)
            } catch {
                print(error)
            }
        }
    }
    
    
    func dragViewReceivedImages(dragView: DragView, images: [String]) {
        self.imagesList = images
        self.collection.reloadData()
    }
    
    func constructStatusItem() {
        
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        self.statusItem.button?.image = NSImage(named: NSImage.Name(rawValue: "StatusIcon"))
        self.statusItem.button?.imageScaling = .scaleAxesIndependently
        
        let menu = NSMenu()

        let pItem = NSMenuItem(title: "x", action: #selector(printQuote(_:)), keyEquivalent: "p")
        pItem.view = MenuView(frame: NSRect(x: 0, y: 0, width: 100, height: 40))
        menu.addItem(pItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        self.statusItem.menu = menu
    }
    
    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
}

