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
    
}
