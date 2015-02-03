//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Henry Saniuk on 2/2/15.
//  Copyright (c) 2015 Henry Saniuk. All rights reserved.
//

import UIKIT

class ScavengerHuntItem: NSObject, NSCoding {
    let NameKey = "nameKey"
    let PhotoKey = "photoKey"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: NameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: PhotoKey)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(NameKey) as String
        photo = aDecoder.decodeObjectForKey(PhotoKey) as? UIImage
    }
    
    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
}