//
//  Models.swift
//  OneStepJournal
//
//  Created by Bernard Huff on 11/14/18.
//  Copyright © 2018 Flyhightech.LLC. All rights reserved.
//

import UIKit
import RealmSwift


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
    }
    
    func imageToURLString(image:UIImage) -> String {
        if let imageDate = image.pngData() {
           let fileName = UUID().uuidString + ".png"
           var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            path?.appendPathComponent(fileName)
            try? imageDate.write(to: path)
            return fileName
            
        }
        return ""
    }
}
