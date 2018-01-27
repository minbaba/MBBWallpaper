//
//  ViewController.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/1/19.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource, DragViewDelegate {
    
    var collection: NSCollectionView!
    @IBOutlet weak var dragView: DragView!
    var imagesList: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.view.bounds)
        self.collection = NSCollectionView(frame: self.view.bounds)
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.register(ImageItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("cell"))
        self.view.addSubview(self.collection)
        
        let layout = NSCollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 60)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        self.collection.collectionViewLayout = layout
        
        dragView.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
//        if let list = self.imagesList {
//            return list.count
//        }
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("cell"), for: indexPath) as! ImageItem
        item.previewImage.image = NSImage(named: NSImage.Name(rawValue: self.imagesList![indexPath.item]))
        return item
    }
    
    
    func dragViewReceivedImages(dragView: DragView, images: [String]) {
        self.imagesList = images
        self.collection.reloadData()
    }
}

