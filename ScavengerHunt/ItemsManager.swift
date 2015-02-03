//
//  ItemsManager.swift
//  ScavengerHunt
//
//  Created by Henry Saniuk on 2/2/15.
//  Copyright (c) 2015 Henry Saniuk. All rights reserved.
//

import Foundation

class ItemsManager {
    
    var items = [ScavengerHuntItem]()
    
    lazy private var archivePath: String = {
        let fileManger = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManger.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask) as [NSURL]
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        return archiveURL.path!
    }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
    
    private func unarchiveSavedItems() {
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [ScavengerHuntItem]
            items = savedItems
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
}
