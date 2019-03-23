//
//  Models.swift
//  OneStepJournal
//
//  Created by Bernard Huff on 11/14/18.
//  Copyright © 2018 Flyhightech.LLC. All rights reserved.
//  Test 1

import UIKit
import RealmSwift
import Toucan


class Entry : Object {
    @objc dynamic var text = ""
    @objc dynamic var date = Date()
    let picture = List<Picture>()
}

class Picture : Object {
    @objc dynamic var fullImageName = ""
    @objc dynamic var thumbnailName = ""
    @objc dynamic var entry : Entry?
    
    convenience init(image: UIImage) {
        self.init()
        fullImageName = imageToURLString(image: image)
        if let smallImage = Toucan(image: image).resize(CGSize(width: 500, height: 500), fitMode: .crop).image {
            thumbnailName = imageToURLString(image: smallImage)
        }
    }
    
    func fullImage() -> UIImage {
        return imageWithFileName(fileName: fullImageName)
    }
    
    func thumbNail() -> UIImage {
        return imageWithFileName(fileName: thumbnailName)
    }
    
    func imageWithFileName(fileName: String) -> UIImage {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            path.appendPathComponent(fileName)
        if let imageData = try? Data(contentsOf: path) {
            if let image = UIImage(data: imageData) {
                return image
            }
        }
        return UIImage() 
    }
    
    func imageToURLString(image:UIImage) -> String {
        if let imageDate = image.pngData() {
           let fileName = UUID().uuidString + ".png"
           var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            path.appendPathComponent(fileName)
            try? imageDate.write(to: path)
            return fileName
            
        }
        return ""
    }
}
