//
//  ColorItem.swift
//  KxUI
//
//  Created by Keun young Kim on 2016. 12. 21..
//  Copyright © 2016년 CocoaPods. All rights reserved.
//

import UIKit
import KxUI

struct ColorItem: ApiDictionaryParsable {
    let color: UIColor
    let name: String
    let rgb: String
    let hex: String
    
    init?(dict: ApiDictionary) {
        return nil
    }
}
