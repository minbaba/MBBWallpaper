//
//  ViewController.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/1/19.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource, DragViewDelegate {
    

    @IBOutlet weak var collection: NSCollectionView!
    @IBOutlet weak var dragView: DragView!
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
    
    
    func dragViewReceivedImages(dragView: DragView, images: [String]) {
        self.imagesList = images
        self.collection.reloadData()
    }
}

