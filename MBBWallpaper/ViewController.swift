//
//  ViewController.swift
//  MBBWallpaper
//
//  Created by minbaba on 2018/1/19.
//  Copyright © 2018年 minbaba Inc. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource {
    
    let collection = NSCollectionView(frame: NSRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        collection.delegate = self
        collection.dataSource = self
        collection.register(NSCollectionViewItem.classForCoder(), forItemWithIdentifier: NSUserInterfaceItemIdentifier.init("cell"))
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier.init("cell"), for: indexPath)
    }
}

