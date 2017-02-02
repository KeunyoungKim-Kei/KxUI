//
//  ColorDataSource.swift
//  KxUI
//
//  Created by Keun young Kim on 2016. 12. 21..
//  Copyright © 2016년 CocoaPods. All rights reserved.
//

import Foundation
import KxUI

class ColorDataSource: KUDataSource<ColorItem> {
    var isAppleColor = true
    
    override func composeList(completion: KUDataFetchCompletion?) {
        
        if isAppleColor {
            let appleList = [(UIColor.Apple.red, "UIColor.Apple.red", UIColor.Apple.red.rgbString, UIColor.Apple.red.rgbHexString),
                             (UIColor.Apple.orange, "UIColor.Apple.orange", UIColor.Apple.orange.rgbString, UIColor.Apple.orange.rgbHexString),
                             (UIColor.Apple.yellow, "UIColor.Apple.yellow", UIColor.Apple.yellow.rgbString, UIColor.Apple.yellow.rgbHexString),
                             (UIColor.Apple.green, "UIColor.Apple.green", UIColor.Apple.green.rgbString, UIColor.Apple.green.rgbHexString),
                             (UIColor.Apple.tealBlue, "UIColor.Apple.tealBlue", UIColor.Apple.tealBlue.rgbString, UIColor.Apple.tealBlue.rgbHexString),
                             (UIColor.Apple.blue, "UIColor.Apple.blue", UIColor.Apple.blue.rgbString, UIColor.Apple.blue.rgbHexString),
                             (UIColor.Apple.purple, "UIColor.Apple.purple", UIColor.Apple.purple.rgbString, UIColor.Apple.purple.rgbHexString),
                             (UIColor.Apple.pink, "UIColor.Apple.pink", UIColor.Apple.pink.rgbString, UIColor.Apple.pink.rgbHexString)]
            
            for color in appleList {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item)
            }
        } else {
            var list = [(UIColor.MaterialRed.primary, "UIColor.MaterialRed.primary", UIColor.MaterialRed.primary.rgbString, UIColor.MaterialRed.primary.rgbHexString),
                           (UIColor.MaterialRed.i50, "UIColor.MaterialRed.i50", UIColor.MaterialRed.i50.rgbString, UIColor.MaterialRed.i50.rgbHexString),
                           (UIColor.MaterialRed.i100, "UIColor.MaterialRed.i100", UIColor.MaterialRed.i100.rgbString, UIColor.MaterialRed.i100.rgbHexString),
                           (UIColor.MaterialRed.i200, "UIColor.MaterialRed.i200", UIColor.MaterialRed.i200.rgbString, UIColor.MaterialRed.i200.rgbHexString),
                           (UIColor.MaterialRed.i300, "UIColor.MaterialRed.i300", UIColor.MaterialRed.i300.rgbString, UIColor.MaterialRed.i300.rgbHexString),
                           (UIColor.MaterialRed.i400, "UIColor.MaterialRed.i400", UIColor.MaterialRed.i400.rgbString, UIColor.MaterialRed.i400.rgbHexString),
                           (UIColor.MaterialRed.i500, "UIColor.MaterialRed.i500", UIColor.MaterialRed.i500.rgbString, UIColor.MaterialRed.i500.rgbHexString),
                           (UIColor.MaterialRed.i600, "UIColor.MaterialRed.i600", UIColor.MaterialRed.i600.rgbString, UIColor.MaterialRed.i600.rgbHexString),
                           (UIColor.MaterialRed.i700, "UIColor.MaterialRed.i700", UIColor.MaterialRed.i700.rgbString, UIColor.MaterialRed.i700.rgbHexString),
                           (UIColor.MaterialRed.i800, "UIColor.MaterialRed.i800", UIColor.MaterialRed.i800.rgbString, UIColor.MaterialRed.i800.rgbHexString),
                           (UIColor.MaterialRed.i900, "UIColor.MaterialRed.i900", UIColor.MaterialRed.i900.rgbString, UIColor.MaterialRed.i900.rgbHexString),
                           (UIColor.MaterialRed.a100, "UIColor.MaterialRed.a100", UIColor.MaterialRed.a100.rgbString, UIColor.MaterialRed.a100.rgbHexString),
                           (UIColor.MaterialRed.a200, "UIColor.MaterialRed.a200", UIColor.MaterialRed.a200.rgbString, UIColor.MaterialRed.a200.rgbHexString),
                           (UIColor.MaterialRed.a400, "UIColor.MaterialRed.a400", UIColor.MaterialRed.a400.rgbString, UIColor.MaterialRed.a400.rgbHexString),
                           (UIColor.MaterialRed.a700, "UIColor.MaterialRed.a700", UIColor.MaterialRed.a700.rgbString, UIColor.MaterialRed.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 0, title: "UIColor.MaterialRed")
            }
            
            list = [(UIColor.MaterialPink.primary, "UIColor.MaterialPink.primary", UIColor.MaterialPink.primary.rgbString, UIColor.MaterialPink.primary.rgbHexString),
                    (UIColor.MaterialPink.i50, "UIColor.MaterialPink.i50", UIColor.MaterialPink.i50.rgbString, UIColor.MaterialPink.i50.rgbHexString),
                    (UIColor.MaterialPink.i100, "UIColor.MaterialPink.i100", UIColor.MaterialPink.i100.rgbString, UIColor.MaterialPink.i100.rgbHexString),
                    (UIColor.MaterialPink.i200, "UIColor.MaterialPink.i200", UIColor.MaterialPink.i200.rgbString, UIColor.MaterialPink.i200.rgbHexString),
                    (UIColor.MaterialPink.i300, "UIColor.MaterialPink.i300", UIColor.MaterialPink.i300.rgbString, UIColor.MaterialPink.i300.rgbHexString),
                    (UIColor.MaterialPink.i400, "UIColor.MaterialPink.i400", UIColor.MaterialPink.i400.rgbString, UIColor.MaterialPink.i400.rgbHexString),
                    (UIColor.MaterialPink.i500, "UIColor.MaterialPink.i500", UIColor.MaterialPink.i500.rgbString, UIColor.MaterialPink.i500.rgbHexString),
                    (UIColor.MaterialPink.i600, "UIColor.MaterialPink.i600", UIColor.MaterialPink.i600.rgbString, UIColor.MaterialPink.i600.rgbHexString),
                    (UIColor.MaterialPink.i700, "UIColor.MaterialPink.i700", UIColor.MaterialPink.i700.rgbString, UIColor.MaterialPink.i700.rgbHexString),
                    (UIColor.MaterialPink.i800, "UIColor.MaterialPink.i800", UIColor.MaterialPink.i800.rgbString, UIColor.MaterialPink.i800.rgbHexString),
                    (UIColor.MaterialPink.i900, "UIColor.MaterialPink.i900", UIColor.MaterialPink.i900.rgbString, UIColor.MaterialPink.i900.rgbHexString),
                    (UIColor.MaterialPink.a100, "UIColor.MaterialPink.a100", UIColor.MaterialPink.a100.rgbString, UIColor.MaterialPink.a100.rgbHexString),
                    (UIColor.MaterialPink.a200, "UIColor.MaterialPink.a200", UIColor.MaterialPink.a200.rgbString, UIColor.MaterialPink.a200.rgbHexString),
                    (UIColor.MaterialPink.a400, "UIColor.MaterialPink.a400", UIColor.MaterialPink.a400.rgbString, UIColor.MaterialPink.a400.rgbHexString),
                    (UIColor.MaterialPink.a700, "UIColor.MaterialPink.a700", UIColor.MaterialPink.a700.rgbString, UIColor.MaterialPink.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 1, title: "UIColor.MaterialPink")
            }
            
            list = [(UIColor.MaterialPurple.primary, "UIColor.MaterialPurple.primary", UIColor.MaterialPurple.primary.rgbString, UIColor.MaterialPurple.primary.rgbHexString),
                    (UIColor.MaterialPurple.i50, "UIColor.MaterialPurple.i50", UIColor.MaterialPurple.i50.rgbString, UIColor.MaterialPurple.i50.rgbHexString),
                    (UIColor.MaterialPurple.i100, "UIColor.MaterialPurple.i100", UIColor.MaterialPurple.i100.rgbString, UIColor.MaterialPurple.i100.rgbHexString),
                    (UIColor.MaterialPurple.i200, "UIColor.MaterialPurple.i200", UIColor.MaterialPurple.i200.rgbString, UIColor.MaterialPurple.i200.rgbHexString),
                    (UIColor.MaterialPurple.i300, "UIColor.MaterialPurple.i300", UIColor.MaterialPurple.i300.rgbString, UIColor.MaterialPurple.i300.rgbHexString),
                    (UIColor.MaterialPurple.i400, "UIColor.MaterialPurple.i400", UIColor.MaterialPurple.i400.rgbString, UIColor.MaterialPurple.i400.rgbHexString),
                    (UIColor.MaterialPurple.i500, "UIColor.MaterialPurple.i500", UIColor.MaterialPurple.i500.rgbString, UIColor.MaterialPurple.i500.rgbHexString),
                    (UIColor.MaterialPurple.i600, "UIColor.MaterialPurple.i600", UIColor.MaterialPurple.i600.rgbString, UIColor.MaterialPurple.i600.rgbHexString),
                    (UIColor.MaterialPurple.i700, "UIColor.MaterialPurple.i700", UIColor.MaterialPurple.i700.rgbString, UIColor.MaterialPurple.i700.rgbHexString),
                    (UIColor.MaterialPurple.i800, "UIColor.MaterialPurple.i800", UIColor.MaterialPurple.i800.rgbString, UIColor.MaterialPurple.i800.rgbHexString),
                    (UIColor.MaterialPurple.i900, "UIColor.MaterialPurple.i900", UIColor.MaterialPurple.i900.rgbString, UIColor.MaterialPurple.i900.rgbHexString),
                    (UIColor.MaterialPurple.a100, "UIColor.MaterialPurple.a100", UIColor.MaterialPurple.a100.rgbString, UIColor.MaterialPurple.a100.rgbHexString),
                    (UIColor.MaterialPurple.a200, "UIColor.MaterialPurple.a200", UIColor.MaterialPurple.a200.rgbString, UIColor.MaterialPurple.a200.rgbHexString),
                    (UIColor.MaterialPurple.a400, "UIColor.MaterialPurple.a400", UIColor.MaterialPurple.a400.rgbString, UIColor.MaterialPurple.a400.rgbHexString),
                    (UIColor.MaterialPurple.a700, "UIColor.MaterialPurple.a700", UIColor.MaterialPurple.a700.rgbString, UIColor.MaterialPurple.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 2, title: "UIColor.MaterialPurple")
            }
            
            list = [(UIColor.MaterialDeepPurple.primary, "UIColor.MaterialDeepPurple.primary", UIColor.MaterialDeepPurple.primary.rgbString, UIColor.MaterialDeepPurple.primary.rgbHexString),
                    (UIColor.MaterialDeepPurple.i50, "UIColor.MaterialDeepPurple.i50", UIColor.MaterialDeepPurple.i50.rgbString, UIColor.MaterialDeepPurple.i50.rgbHexString),
                    (UIColor.MaterialDeepPurple.i100, "UIColor.MaterialDeepPurple.i100", UIColor.MaterialDeepPurple.i100.rgbString, UIColor.MaterialDeepPurple.i100.rgbHexString),
                    (UIColor.MaterialDeepPurple.i200, "UIColor.MaterialDeepPurple.i200", UIColor.MaterialDeepPurple.i200.rgbString, UIColor.MaterialDeepPurple.i200.rgbHexString),
                    (UIColor.MaterialDeepPurple.i300, "UIColor.MaterialDeepPurple.i300", UIColor.MaterialDeepPurple.i300.rgbString, UIColor.MaterialDeepPurple.i300.rgbHexString),
                    (UIColor.MaterialDeepPurple.i400, "UIColor.MaterialDeepPurple.i400", UIColor.MaterialDeepPurple.i400.rgbString, UIColor.MaterialDeepPurple.i400.rgbHexString),
                    (UIColor.MaterialDeepPurple.i500, "UIColor.MaterialDeepPurple.i500", UIColor.MaterialDeepPurple.i500.rgbString, UIColor.MaterialDeepPurple.i500.rgbHexString),
                    (UIColor.MaterialDeepPurple.i600, "UIColor.MaterialDeepPurple.i600", UIColor.MaterialDeepPurple.i600.rgbString, UIColor.MaterialDeepPurple.i600.rgbHexString),
                    (UIColor.MaterialDeepPurple.i700, "UIColor.MaterialDeepPurple.i700", UIColor.MaterialDeepPurple.i700.rgbString, UIColor.MaterialDeepPurple.i700.rgbHexString),
                    (UIColor.MaterialDeepPurple.i800, "UIColor.MaterialDeepPurple.i800", UIColor.MaterialDeepPurple.i800.rgbString, UIColor.MaterialDeepPurple.i800.rgbHexString),
                    (UIColor.MaterialDeepPurple.i900, "UIColor.MaterialDeepPurple.i900", UIColor.MaterialDeepPurple.i900.rgbString, UIColor.MaterialDeepPurple.i900.rgbHexString),
                    (UIColor.MaterialDeepPurple.a100, "UIColor.MaterialDeepPurple.a100", UIColor.MaterialDeepPurple.a100.rgbString, UIColor.MaterialDeepPurple.a100.rgbHexString),
                    (UIColor.MaterialDeepPurple.a200, "UIColor.MaterialDeepPurple.a200", UIColor.MaterialDeepPurple.a200.rgbString, UIColor.MaterialDeepPurple.a200.rgbHexString),
                    (UIColor.MaterialDeepPurple.a400, "UIColor.MaterialDeepPurple.a400", UIColor.MaterialDeepPurple.a400.rgbString, UIColor.MaterialDeepPurple.a400.rgbHexString),
                    (UIColor.MaterialDeepPurple.a700, "UIColor.MaterialDeepPurple.a700", UIColor.MaterialDeepPurple.a700.rgbString, UIColor.MaterialDeepPurple.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 3, title: "UIColor.MaterialDeepPurple")
            }
            
            list = [(UIColor.MaterialIndigo.primary, "UIColor.MaterialIndigo.primary", UIColor.MaterialIndigo.primary.rgbString, UIColor.MaterialIndigo.primary.rgbHexString),
                    (UIColor.MaterialIndigo.i50, "UIColor.MaterialIndigo.i50", UIColor.MaterialIndigo.i50.rgbString, UIColor.MaterialIndigo.i50.rgbHexString),
                    (UIColor.MaterialIndigo.i100, "UIColor.MaterialIndigo.i100", UIColor.MaterialIndigo.i100.rgbString, UIColor.MaterialIndigo.i100.rgbHexString),
                    (UIColor.MaterialIndigo.i200, "UIColor.MaterialIndigo.i200", UIColor.MaterialIndigo.i200.rgbString, UIColor.MaterialIndigo.i200.rgbHexString),
                    (UIColor.MaterialIndigo.i300, "UIColor.MaterialIndigo.i300", UIColor.MaterialIndigo.i300.rgbString, UIColor.MaterialIndigo.i300.rgbHexString),
                    (UIColor.MaterialIndigo.i400, "UIColor.MaterialIndigo.i400", UIColor.MaterialIndigo.i400.rgbString, UIColor.MaterialIndigo.i400.rgbHexString),
                    (UIColor.MaterialIndigo.i500, "UIColor.MaterialIndigo.i500", UIColor.MaterialIndigo.i500.rgbString, UIColor.MaterialIndigo.i500.rgbHexString),
                    (UIColor.MaterialIndigo.i600, "UIColor.MaterialIndigo.i600", UIColor.MaterialIndigo.i600.rgbString, UIColor.MaterialIndigo.i600.rgbHexString),
                    (UIColor.MaterialIndigo.i700, "UIColor.MaterialIndigo.i700", UIColor.MaterialIndigo.i700.rgbString, UIColor.MaterialIndigo.i700.rgbHexString),
                    (UIColor.MaterialIndigo.i800, "UIColor.MaterialIndigo.i800", UIColor.MaterialIndigo.i800.rgbString, UIColor.MaterialIndigo.i800.rgbHexString),
                    (UIColor.MaterialIndigo.i900, "UIColor.MaterialIndigo.i900", UIColor.MaterialIndigo.i900.rgbString, UIColor.MaterialIndigo.i900.rgbHexString),
                    (UIColor.MaterialIndigo.a100, "UIColor.MaterialIndigo.a100", UIColor.MaterialIndigo.a100.rgbString, UIColor.MaterialIndigo.a100.rgbHexString),
                    (UIColor.MaterialIndigo.a200, "UIColor.MaterialIndigo.a200", UIColor.MaterialIndigo.a200.rgbString, UIColor.MaterialIndigo.a200.rgbHexString),
                    (UIColor.MaterialIndigo.a400, "UIColor.MaterialIndigo.a400", UIColor.MaterialIndigo.a400.rgbString, UIColor.MaterialIndigo.a400.rgbHexString),
                    (UIColor.MaterialIndigo.a700, "UIColor.MaterialIndigo.a700", UIColor.MaterialIndigo.a700.rgbString, UIColor.MaterialIndigo.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 4, title: "UIColor.MaterialIndigo")
            }
            
            list = [(UIColor.MaterialBlue.primary, "UIColor.MaterialBlue.primary", UIColor.MaterialBlue.primary.rgbString, UIColor.MaterialBlue.primary.rgbHexString),
                    (UIColor.MaterialBlue.i50, "UIColor.MaterialBlue.i50", UIColor.MaterialBlue.i50.rgbString, UIColor.MaterialBlue.i50.rgbHexString),
                    (UIColor.MaterialBlue.i100, "UIColor.MaterialBlue.i100", UIColor.MaterialBlue.i100.rgbString, UIColor.MaterialBlue.i100.rgbHexString),
                    (UIColor.MaterialBlue.i200, "UIColor.MaterialBlue.i200", UIColor.MaterialBlue.i200.rgbString, UIColor.MaterialBlue.i200.rgbHexString),
                    (UIColor.MaterialBlue.i300, "UIColor.MaterialBlue.i300", UIColor.MaterialBlue.i300.rgbString, UIColor.MaterialBlue.i300.rgbHexString),
                    (UIColor.MaterialBlue.i400, "UIColor.MaterialBlue.i400", UIColor.MaterialBlue.i400.rgbString, UIColor.MaterialBlue.i400.rgbHexString),
                    (UIColor.MaterialBlue.i500, "UIColor.MaterialBlue.i500", UIColor.MaterialBlue.i500.rgbString, UIColor.MaterialBlue.i500.rgbHexString),
                    (UIColor.MaterialBlue.i600, "UIColor.MaterialBlue.i600", UIColor.MaterialBlue.i600.rgbString, UIColor.MaterialBlue.i600.rgbHexString),
                    (UIColor.MaterialBlue.i700, "UIColor.MaterialBlue.i700", UIColor.MaterialBlue.i700.rgbString, UIColor.MaterialBlue.i700.rgbHexString),
                    (UIColor.MaterialBlue.i800, "UIColor.MaterialBlue.i800", UIColor.MaterialBlue.i800.rgbString, UIColor.MaterialBlue.i800.rgbHexString),
                    (UIColor.MaterialBlue.i900, "UIColor.MaterialBlue.i900", UIColor.MaterialBlue.i900.rgbString, UIColor.MaterialBlue.i900.rgbHexString),
                    (UIColor.MaterialBlue.a100, "UIColor.MaterialBlue.a100", UIColor.MaterialBlue.a100.rgbString, UIColor.MaterialBlue.a100.rgbHexString),
                    (UIColor.MaterialBlue.a200, "UIColor.MaterialBlue.a200", UIColor.MaterialBlue.a200.rgbString, UIColor.MaterialBlue.a200.rgbHexString),
                    (UIColor.MaterialBlue.a400, "UIColor.MaterialBlue.a400", UIColor.MaterialBlue.a400.rgbString, UIColor.MaterialBlue.a400.rgbHexString),
                    (UIColor.MaterialBlue.a700, "UIColor.MaterialBlue.a700", UIColor.MaterialBlue.a700.rgbString, UIColor.MaterialBlue.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 5, title: "UIColor.MaterialBlue")
            }
            
            list = [(UIColor.MaterialLightBlue.primary, "UIColor.MaterialLightBlue.primary", UIColor.MaterialLightBlue.primary.rgbString, UIColor.MaterialLightBlue.primary.rgbHexString),
                    (UIColor.MaterialLightBlue.i50, "UIColor.MaterialLightBlue.i50", UIColor.MaterialLightBlue.i50.rgbString, UIColor.MaterialLightBlue.i50.rgbHexString),
                    (UIColor.MaterialLightBlue.i100, "UIColor.MaterialLightBlue.i100", UIColor.MaterialLightBlue.i100.rgbString, UIColor.MaterialLightBlue.i100.rgbHexString),
                    (UIColor.MaterialLightBlue.i200, "UIColor.MaterialLightBlue.i200", UIColor.MaterialLightBlue.i200.rgbString, UIColor.MaterialLightBlue.i200.rgbHexString),
                    (UIColor.MaterialLightBlue.i300, "UIColor.MaterialLightBlue.i300", UIColor.MaterialLightBlue.i300.rgbString, UIColor.MaterialLightBlue.i300.rgbHexString),
                    (UIColor.MaterialLightBlue.i400, "UIColor.MaterialLightBlue.i400", UIColor.MaterialLightBlue.i400.rgbString, UIColor.MaterialLightBlue.i400.rgbHexString),
                    (UIColor.MaterialLightBlue.i500, "UIColor.MaterialLightBlue.i500", UIColor.MaterialLightBlue.i500.rgbString, UIColor.MaterialLightBlue.i500.rgbHexString),
                    (UIColor.MaterialLightBlue.i600, "UIColor.MaterialLightBlue.i600", UIColor.MaterialLightBlue.i600.rgbString, UIColor.MaterialLightBlue.i600.rgbHexString),
                    (UIColor.MaterialLightBlue.i700, "UIColor.MaterialLightBlue.i700", UIColor.MaterialLightBlue.i700.rgbString, UIColor.MaterialLightBlue.i700.rgbHexString),
                    (UIColor.MaterialLightBlue.i800, "UIColor.MaterialLightBlue.i800", UIColor.MaterialLightBlue.i800.rgbString, UIColor.MaterialLightBlue.i800.rgbHexString),
                    (UIColor.MaterialLightBlue.i900, "UIColor.MaterialLightBlue.i900", UIColor.MaterialLightBlue.i900.rgbString, UIColor.MaterialLightBlue.i900.rgbHexString),
                    (UIColor.MaterialLightBlue.a100, "UIColor.MaterialLightBlue.a100", UIColor.MaterialLightBlue.a100.rgbString, UIColor.MaterialLightBlue.a100.rgbHexString),
                    (UIColor.MaterialLightBlue.a200, "UIColor.MaterialLightBlue.a200", UIColor.MaterialLightBlue.a200.rgbString, UIColor.MaterialLightBlue.a200.rgbHexString),
                    (UIColor.MaterialLightBlue.a400, "UIColor.MaterialLightBlue.a400", UIColor.MaterialLightBlue.a400.rgbString, UIColor.MaterialLightBlue.a400.rgbHexString),
                    (UIColor.MaterialLightBlue.a700, "UIColor.MaterialLightBlue.a700", UIColor.MaterialLightBlue.a700.rgbString, UIColor.MaterialLightBlue.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 6, title: "UIColor.MaterialLightBlue")
            }
            
            list = [(UIColor.MaterialCyan.primary, "UIColor.MaterialCyan.primary", UIColor.MaterialCyan.primary.rgbString, UIColor.MaterialCyan.primary.rgbHexString),
                    (UIColor.MaterialCyan.i50, "UIColor.MaterialCyan.i50", UIColor.MaterialCyan.i50.rgbString, UIColor.MaterialCyan.i50.rgbHexString),
                    (UIColor.MaterialCyan.i100, "UIColor.MaterialCyan.i100", UIColor.MaterialCyan.i100.rgbString, UIColor.MaterialCyan.i100.rgbHexString),
                    (UIColor.MaterialCyan.i200, "UIColor.MaterialCyan.i200", UIColor.MaterialCyan.i200.rgbString, UIColor.MaterialCyan.i200.rgbHexString),
                    (UIColor.MaterialCyan.i300, "UIColor.MaterialCyan.i300", UIColor.MaterialCyan.i300.rgbString, UIColor.MaterialCyan.i300.rgbHexString),
                    (UIColor.MaterialCyan.i400, "UIColor.MaterialCyan.i400", UIColor.MaterialCyan.i400.rgbString, UIColor.MaterialCyan.i400.rgbHexString),
                    (UIColor.MaterialCyan.i500, "UIColor.MaterialCyan.i500", UIColor.MaterialCyan.i500.rgbString, UIColor.MaterialCyan.i500.rgbHexString),
                    (UIColor.MaterialCyan.i600, "UIColor.MaterialCyan.i600", UIColor.MaterialCyan.i600.rgbString, UIColor.MaterialCyan.i600.rgbHexString),
                    (UIColor.MaterialCyan.i700, "UIColor.MaterialCyan.i700", UIColor.MaterialCyan.i700.rgbString, UIColor.MaterialCyan.i700.rgbHexString),
                    (UIColor.MaterialCyan.i800, "UIColor.MaterialCyan.i800", UIColor.MaterialCyan.i800.rgbString, UIColor.MaterialCyan.i800.rgbHexString),
                    (UIColor.MaterialCyan.i900, "UIColor.MaterialCyan.i900", UIColor.MaterialCyan.i900.rgbString, UIColor.MaterialCyan.i900.rgbHexString),
                    (UIColor.MaterialCyan.a100, "UIColor.MaterialCyan.a100", UIColor.MaterialCyan.a100.rgbString, UIColor.MaterialCyan.a100.rgbHexString),
                    (UIColor.MaterialCyan.a200, "UIColor.MaterialCyan.a200", UIColor.MaterialCyan.a200.rgbString, UIColor.MaterialCyan.a200.rgbHexString),
                    (UIColor.MaterialCyan.a400, "UIColor.MaterialCyan.a400", UIColor.MaterialCyan.a400.rgbString, UIColor.MaterialCyan.a400.rgbHexString),
                    (UIColor.MaterialCyan.a700, "UIColor.MaterialCyan.a700", UIColor.MaterialCyan.a700.rgbString, UIColor.MaterialCyan.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 7, title: "UIColor.MaterialCyan")
            }
            
            list = [(UIColor.MaterialTeal.primary, "UIColor.MaterialTeal.primary", UIColor.MaterialTeal.primary.rgbString, UIColor.MaterialTeal.primary.rgbHexString),
                    (UIColor.MaterialTeal.i50, "UIColor.MaterialTeal.i50", UIColor.MaterialTeal.i50.rgbString, UIColor.MaterialTeal.i50.rgbHexString),
                    (UIColor.MaterialTeal.i100, "UIColor.MaterialTeal.i100", UIColor.MaterialTeal.i100.rgbString, UIColor.MaterialTeal.i100.rgbHexString),
                    (UIColor.MaterialTeal.i200, "UIColor.MaterialTeal.i200", UIColor.MaterialTeal.i200.rgbString, UIColor.MaterialTeal.i200.rgbHexString),
                    (UIColor.MaterialTeal.i300, "UIColor.MaterialTeal.i300", UIColor.MaterialTeal.i300.rgbString, UIColor.MaterialTeal.i300.rgbHexString),
                    (UIColor.MaterialTeal.i400, "UIColor.MaterialTeal.i400", UIColor.MaterialTeal.i400.rgbString, UIColor.MaterialTeal.i400.rgbHexString),
                    (UIColor.MaterialTeal.i500, "UIColor.MaterialTeal.i500", UIColor.MaterialTeal.i500.rgbString, UIColor.MaterialTeal.i500.rgbHexString),
                    (UIColor.MaterialTeal.i600, "UIColor.MaterialTeal.i600", UIColor.MaterialTeal.i600.rgbString, UIColor.MaterialTeal.i600.rgbHexString),
                    (UIColor.MaterialTeal.i700, "UIColor.MaterialTeal.i700", UIColor.MaterialTeal.i700.rgbString, UIColor.MaterialTeal.i700.rgbHexString),
                    (UIColor.MaterialTeal.i800, "UIColor.MaterialTeal.i800", UIColor.MaterialTeal.i800.rgbString, UIColor.MaterialTeal.i800.rgbHexString),
                    (UIColor.MaterialTeal.i900, "UIColor.MaterialTeal.i900", UIColor.MaterialTeal.i900.rgbString, UIColor.MaterialTeal.i900.rgbHexString),
                    (UIColor.MaterialTeal.a100, "UIColor.MaterialTeal.a100", UIColor.MaterialTeal.a100.rgbString, UIColor.MaterialTeal.a100.rgbHexString),
                    (UIColor.MaterialTeal.a200, "UIColor.MaterialTeal.a200", UIColor.MaterialTeal.a200.rgbString, UIColor.MaterialTeal.a200.rgbHexString),
                    (UIColor.MaterialTeal.a400, "UIColor.MaterialTeal.a400", UIColor.MaterialTeal.a400.rgbString, UIColor.MaterialTeal.a400.rgbHexString),
                    (UIColor.MaterialTeal.a700, "UIColor.MaterialTeal.a700", UIColor.MaterialTeal.a700.rgbString, UIColor.MaterialTeal.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 8, title: "UIColor.MaterialTeal")
            }
            
            
            list = [(UIColor.MaterialGreen.primary, "UIColor.MaterialGreen.primary", UIColor.MaterialGreen.primary.rgbString, UIColor.MaterialGreen.primary.rgbHexString),
                    (UIColor.MaterialGreen.i50, "UIColor.MaterialGreen.i50", UIColor.MaterialGreen.i50.rgbString, UIColor.MaterialGreen.i50.rgbHexString),
                    (UIColor.MaterialGreen.i100, "UIColor.MaterialGreen.i100", UIColor.MaterialGreen.i100.rgbString, UIColor.MaterialGreen.i100.rgbHexString),
                    (UIColor.MaterialGreen.i200, "UIColor.MaterialGreen.i200", UIColor.MaterialGreen.i200.rgbString, UIColor.MaterialGreen.i200.rgbHexString),
                    (UIColor.MaterialGreen.i300, "UIColor.MaterialGreen.i300", UIColor.MaterialGreen.i300.rgbString, UIColor.MaterialGreen.i300.rgbHexString),
                    (UIColor.MaterialGreen.i400, "UIColor.MaterialGreen.i400", UIColor.MaterialGreen.i400.rgbString, UIColor.MaterialGreen.i400.rgbHexString),
                    (UIColor.MaterialGreen.i500, "UIColor.MaterialGreen.i500", UIColor.MaterialGreen.i500.rgbString, UIColor.MaterialGreen.i500.rgbHexString),
                    (UIColor.MaterialGreen.i600, "UIColor.MaterialGreen.i600", UIColor.MaterialGreen.i600.rgbString, UIColor.MaterialGreen.i600.rgbHexString),
                    (UIColor.MaterialGreen.i700, "UIColor.MaterialGreen.i700", UIColor.MaterialGreen.i700.rgbString, UIColor.MaterialGreen.i700.rgbHexString),
                    (UIColor.MaterialGreen.i800, "UIColor.MaterialGreen.i800", UIColor.MaterialGreen.i800.rgbString, UIColor.MaterialGreen.i800.rgbHexString),
                    (UIColor.MaterialGreen.i900, "UIColor.MaterialGreen.i900", UIColor.MaterialGreen.i900.rgbString, UIColor.MaterialGreen.i900.rgbHexString),
                    (UIColor.MaterialGreen.a100, "UIColor.MaterialGreen.a100", UIColor.MaterialGreen.a100.rgbString, UIColor.MaterialGreen.a100.rgbHexString),
                    (UIColor.MaterialGreen.a200, "UIColor.MaterialGreen.a200", UIColor.MaterialGreen.a200.rgbString, UIColor.MaterialGreen.a200.rgbHexString),
                    (UIColor.MaterialGreen.a400, "UIColor.MaterialGreen.a400", UIColor.MaterialGreen.a400.rgbString, UIColor.MaterialGreen.a400.rgbHexString),
                    (UIColor.MaterialGreen.a700, "UIColor.MaterialGreen.a700", UIColor.MaterialGreen.a700.rgbString, UIColor.MaterialGreen.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 9, title: "UIColor.MaterialGreen")
            }
            
            list = [(UIColor.MaterialLightGreen.primary, "UIColor.MaterialLightGreen.primary", UIColor.MaterialLightGreen.primary.rgbString, UIColor.MaterialLightGreen.primary.rgbHexString),
                    (UIColor.MaterialLightGreen.i50, "UIColor.MaterialLightGreen.i50", UIColor.MaterialLightGreen.i50.rgbString, UIColor.MaterialLightGreen.i50.rgbHexString),
                    (UIColor.MaterialLightGreen.i100, "UIColor.MaterialLightGreen.i100", UIColor.MaterialLightGreen.i100.rgbString, UIColor.MaterialLightGreen.i100.rgbHexString),
                    (UIColor.MaterialLightGreen.i200, "UIColor.MaterialLightGreen.i200", UIColor.MaterialLightGreen.i200.rgbString, UIColor.MaterialLightGreen.i200.rgbHexString),
                    (UIColor.MaterialLightGreen.i300, "UIColor.MaterialLightGreen.i300", UIColor.MaterialLightGreen.i300.rgbString, UIColor.MaterialLightGreen.i300.rgbHexString),
                    (UIColor.MaterialLightGreen.i400, "UIColor.MaterialLightGreen.i400", UIColor.MaterialLightGreen.i400.rgbString, UIColor.MaterialLightGreen.i400.rgbHexString),
                    (UIColor.MaterialLightGreen.i500, "UIColor.MaterialLightGreen.i500", UIColor.MaterialLightGreen.i500.rgbString, UIColor.MaterialLightGreen.i500.rgbHexString),
                    (UIColor.MaterialLightGreen.i600, "UIColor.MaterialLightGreen.i600", UIColor.MaterialLightGreen.i600.rgbString, UIColor.MaterialLightGreen.i600.rgbHexString),
                    (UIColor.MaterialLightGreen.i700, "UIColor.MaterialLightGreen.i700", UIColor.MaterialLightGreen.i700.rgbString, UIColor.MaterialLightGreen.i700.rgbHexString),
                    (UIColor.MaterialLightGreen.i800, "UIColor.MaterialLightGreen.i800", UIColor.MaterialLightGreen.i800.rgbString, UIColor.MaterialLightGreen.i800.rgbHexString),
                    (UIColor.MaterialLightGreen.i900, "UIColor.MaterialLightGreen.i900", UIColor.MaterialLightGreen.i900.rgbString, UIColor.MaterialLightGreen.i900.rgbHexString),
                    (UIColor.MaterialLightGreen.a100, "UIColor.MaterialLightGreen.a100", UIColor.MaterialLightGreen.a100.rgbString, UIColor.MaterialLightGreen.a100.rgbHexString),
                    (UIColor.MaterialLightGreen.a200, "UIColor.MaterialLightGreen.a200", UIColor.MaterialLightGreen.a200.rgbString, UIColor.MaterialLightGreen.a200.rgbHexString),
                    (UIColor.MaterialLightGreen.a400, "UIColor.MaterialLightGreen.a400", UIColor.MaterialLightGreen.a400.rgbString, UIColor.MaterialLightGreen.a400.rgbHexString),
                    (UIColor.MaterialLightGreen.a700, "UIColor.MaterialLightGreen.a700", UIColor.MaterialLightGreen.a700.rgbString, UIColor.MaterialLightGreen.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 10, title: "UIColor.MaterialLightGreen")
            }
            
            
            list = [(UIColor.MaterialLime.primary, "UIColor.MaterialLime.primary", UIColor.MaterialLime.primary.rgbString, UIColor.MaterialLime.primary.rgbHexString),
                    (UIColor.MaterialLime.i50, "UIColor.MaterialLime.i50", UIColor.MaterialLime.i50.rgbString, UIColor.MaterialLime.i50.rgbHexString),
                    (UIColor.MaterialLime.i100, "UIColor.MaterialLime.i100", UIColor.MaterialLime.i100.rgbString, UIColor.MaterialLime.i100.rgbHexString),
                    (UIColor.MaterialLime.i200, "UIColor.MaterialLime.i200", UIColor.MaterialLime.i200.rgbString, UIColor.MaterialLime.i200.rgbHexString),
                    (UIColor.MaterialLime.i300, "UIColor.MaterialLime.i300", UIColor.MaterialLime.i300.rgbString, UIColor.MaterialLime.i300.rgbHexString),
                    (UIColor.MaterialLime.i400, "UIColor.MaterialLime.i400", UIColor.MaterialLime.i400.rgbString, UIColor.MaterialLime.i400.rgbHexString),
                    (UIColor.MaterialLime.i500, "UIColor.MaterialLime.i500", UIColor.MaterialLime.i500.rgbString, UIColor.MaterialLime.i500.rgbHexString),
                    (UIColor.MaterialLime.i600, "UIColor.MaterialLime.i600", UIColor.MaterialLime.i600.rgbString, UIColor.MaterialLime.i600.rgbHexString),
                    (UIColor.MaterialLime.i700, "UIColor.MaterialLime.i700", UIColor.MaterialLime.i700.rgbString, UIColor.MaterialLime.i700.rgbHexString),
                    (UIColor.MaterialLime.i800, "UIColor.MaterialLime.i800", UIColor.MaterialLime.i800.rgbString, UIColor.MaterialLime.i800.rgbHexString),
                    (UIColor.MaterialLime.i900, "UIColor.MaterialLime.i900", UIColor.MaterialLime.i900.rgbString, UIColor.MaterialLime.i900.rgbHexString),
                    (UIColor.MaterialLime.a100, "UIColor.MaterialLime.a100", UIColor.MaterialLime.a100.rgbString, UIColor.MaterialLime.a100.rgbHexString),
                    (UIColor.MaterialLime.a200, "UIColor.MaterialLime.a200", UIColor.MaterialLime.a200.rgbString, UIColor.MaterialLime.a200.rgbHexString),
                    (UIColor.MaterialLime.a400, "UIColor.MaterialLime.a400", UIColor.MaterialLime.a400.rgbString, UIColor.MaterialLime.a400.rgbHexString),
                    (UIColor.MaterialLime.a700, "UIColor.MaterialLime.a700", UIColor.MaterialLime.a700.rgbString, UIColor.MaterialLime.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 11, title: "UIColor.MaterialLime")
            }
            
            list = [(UIColor.MaterialYellow.primary, "UIColor.MaterialYellow.primary", UIColor.MaterialYellow.primary.rgbString, UIColor.MaterialYellow.primary.rgbHexString),
                    (UIColor.MaterialYellow.i50, "UIColor.MaterialYellow.i50", UIColor.MaterialYellow.i50.rgbString, UIColor.MaterialYellow.i50.rgbHexString),
                    (UIColor.MaterialYellow.i100, "UIColor.MaterialYellow.i100", UIColor.MaterialYellow.i100.rgbString, UIColor.MaterialYellow.i100.rgbHexString),
                    (UIColor.MaterialYellow.i200, "UIColor.MaterialYellow.i200", UIColor.MaterialYellow.i200.rgbString, UIColor.MaterialYellow.i200.rgbHexString),
                    (UIColor.MaterialYellow.i300, "UIColor.MaterialYellow.i300", UIColor.MaterialYellow.i300.rgbString, UIColor.MaterialYellow.i300.rgbHexString),
                    (UIColor.MaterialYellow.i400, "UIColor.MaterialYellow.i400", UIColor.MaterialYellow.i400.rgbString, UIColor.MaterialYellow.i400.rgbHexString),
                    (UIColor.MaterialYellow.i500, "UIColor.MaterialYellow.i500", UIColor.MaterialYellow.i500.rgbString, UIColor.MaterialYellow.i500.rgbHexString),
                    (UIColor.MaterialYellow.i600, "UIColor.MaterialYellow.i600", UIColor.MaterialYellow.i600.rgbString, UIColor.MaterialYellow.i600.rgbHexString),
                    (UIColor.MaterialYellow.i700, "UIColor.MaterialYellow.i700", UIColor.MaterialYellow.i700.rgbString, UIColor.MaterialYellow.i700.rgbHexString),
                    (UIColor.MaterialYellow.i800, "UIColor.MaterialYellow.i800", UIColor.MaterialYellow.i800.rgbString, UIColor.MaterialYellow.i800.rgbHexString),
                    (UIColor.MaterialYellow.i900, "UIColor.MaterialYellow.i900", UIColor.MaterialYellow.i900.rgbString, UIColor.MaterialYellow.i900.rgbHexString),
                    (UIColor.MaterialYellow.a100, "UIColor.MaterialYellow.a100", UIColor.MaterialYellow.a100.rgbString, UIColor.MaterialYellow.a100.rgbHexString),
                    (UIColor.MaterialYellow.a200, "UIColor.MaterialYellow.a200", UIColor.MaterialYellow.a200.rgbString, UIColor.MaterialYellow.a200.rgbHexString),
                    (UIColor.MaterialYellow.a400, "UIColor.MaterialYellow.a400", UIColor.MaterialYellow.a400.rgbString, UIColor.MaterialYellow.a400.rgbHexString),
                    (UIColor.MaterialYellow.a700, "UIColor.MaterialYellow.a700", UIColor.MaterialYellow.a700.rgbString, UIColor.MaterialYellow.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 12, title: "UIColor.MaterialYellow")
            }
            
            
            list = [(UIColor.MaterialAmber.primary, "UIColor.MaterialAmber.primary", UIColor.MaterialAmber.primary.rgbString, UIColor.MaterialAmber.primary.rgbHexString),
                    (UIColor.MaterialAmber.i50, "UIColor.MaterialAmber.i50", UIColor.MaterialAmber.i50.rgbString, UIColor.MaterialAmber.i50.rgbHexString),
                    (UIColor.MaterialAmber.i100, "UIColor.MaterialAmber.i100", UIColor.MaterialAmber.i100.rgbString, UIColor.MaterialAmber.i100.rgbHexString),
                    (UIColor.MaterialAmber.i200, "UIColor.MaterialAmber.i200", UIColor.MaterialAmber.i200.rgbString, UIColor.MaterialAmber.i200.rgbHexString),
                    (UIColor.MaterialAmber.i300, "UIColor.MaterialAmber.i300", UIColor.MaterialAmber.i300.rgbString, UIColor.MaterialAmber.i300.rgbHexString),
                    (UIColor.MaterialAmber.i400, "UIColor.MaterialAmber.i400", UIColor.MaterialAmber.i400.rgbString, UIColor.MaterialAmber.i400.rgbHexString),
                    (UIColor.MaterialAmber.i500, "UIColor.MaterialAmber.i500", UIColor.MaterialAmber.i500.rgbString, UIColor.MaterialAmber.i500.rgbHexString),
                    (UIColor.MaterialAmber.i600, "UIColor.MaterialAmber.i600", UIColor.MaterialAmber.i600.rgbString, UIColor.MaterialAmber.i600.rgbHexString),
                    (UIColor.MaterialAmber.i700, "UIColor.MaterialAmber.i700", UIColor.MaterialAmber.i700.rgbString, UIColor.MaterialAmber.i700.rgbHexString),
                    (UIColor.MaterialAmber.i800, "UIColor.MaterialAmber.i800", UIColor.MaterialAmber.i800.rgbString, UIColor.MaterialAmber.i800.rgbHexString),
                    (UIColor.MaterialAmber.i900, "UIColor.MaterialAmber.i900", UIColor.MaterialAmber.i900.rgbString, UIColor.MaterialAmber.i900.rgbHexString),
                    (UIColor.MaterialAmber.a100, "UIColor.MaterialAmber.a100", UIColor.MaterialAmber.a100.rgbString, UIColor.MaterialAmber.a100.rgbHexString),
                    (UIColor.MaterialAmber.a200, "UIColor.MaterialAmber.a200", UIColor.MaterialAmber.a200.rgbString, UIColor.MaterialAmber.a200.rgbHexString),
                    (UIColor.MaterialAmber.a400, "UIColor.MaterialAmber.a400", UIColor.MaterialAmber.a400.rgbString, UIColor.MaterialAmber.a400.rgbHexString),
                    (UIColor.MaterialAmber.a700, "UIColor.MaterialAmber.a700", UIColor.MaterialAmber.a700.rgbString, UIColor.MaterialAmber.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 12, title: "UIColor.MaterialAmber")
            }
            
            
            list = [(UIColor.MaterialOrange.primary, "UIColor.MaterialOrange.primary", UIColor.MaterialOrange.primary.rgbString, UIColor.MaterialOrange.primary.rgbHexString),
                    (UIColor.MaterialOrange.i50, "UIColor.MaterialOrange.i50", UIColor.MaterialOrange.i50.rgbString, UIColor.MaterialOrange.i50.rgbHexString),
                    (UIColor.MaterialOrange.i100, "UIColor.MaterialOrange.i100", UIColor.MaterialOrange.i100.rgbString, UIColor.MaterialOrange.i100.rgbHexString),
                    (UIColor.MaterialOrange.i200, "UIColor.MaterialOrange.i200", UIColor.MaterialOrange.i200.rgbString, UIColor.MaterialOrange.i200.rgbHexString),
                    (UIColor.MaterialOrange.i300, "UIColor.MaterialOrange.i300", UIColor.MaterialOrange.i300.rgbString, UIColor.MaterialOrange.i300.rgbHexString),
                    (UIColor.MaterialOrange.i400, "UIColor.MaterialOrange.i400", UIColor.MaterialOrange.i400.rgbString, UIColor.MaterialOrange.i400.rgbHexString),
                    (UIColor.MaterialOrange.i500, "UIColor.MaterialOrange.i500", UIColor.MaterialOrange.i500.rgbString, UIColor.MaterialOrange.i500.rgbHexString),
                    (UIColor.MaterialOrange.i600, "UIColor.MaterialOrange.i600", UIColor.MaterialOrange.i600.rgbString, UIColor.MaterialOrange.i600.rgbHexString),
                    (UIColor.MaterialOrange.i700, "UIColor.MaterialOrange.i700", UIColor.MaterialOrange.i700.rgbString, UIColor.MaterialOrange.i700.rgbHexString),
                    (UIColor.MaterialOrange.i800, "UIColor.MaterialOrange.i800", UIColor.MaterialOrange.i800.rgbString, UIColor.MaterialOrange.i800.rgbHexString),
                    (UIColor.MaterialOrange.i900, "UIColor.MaterialOrange.i900", UIColor.MaterialOrange.i900.rgbString, UIColor.MaterialOrange.i900.rgbHexString),
                    (UIColor.MaterialOrange.a100, "UIColor.MaterialOrange.a100", UIColor.MaterialOrange.a100.rgbString, UIColor.MaterialOrange.a100.rgbHexString),
                    (UIColor.MaterialOrange.a200, "UIColor.MaterialOrange.a200", UIColor.MaterialOrange.a200.rgbString, UIColor.MaterialOrange.a200.rgbHexString),
                    (UIColor.MaterialOrange.a400, "UIColor.MaterialOrange.a400", UIColor.MaterialOrange.a400.rgbString, UIColor.MaterialOrange.a400.rgbHexString),
                    (UIColor.MaterialOrange.a700, "UIColor.MaterialOrange.a700", UIColor.MaterialOrange.a700.rgbString, UIColor.MaterialOrange.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 13, title: "UIColor.MaterialOrange")
            }
            
            list = [(UIColor.MaterialDeepOrange.primary, "UIColor.MaterialDeepOrange.primary", UIColor.MaterialDeepOrange.primary.rgbString, UIColor.MaterialDeepOrange.primary.rgbHexString),
                    (UIColor.MaterialDeepOrange.i50, "UIColor.MaterialDeepOrange.i50", UIColor.MaterialDeepOrange.i50.rgbString, UIColor.MaterialDeepOrange.i50.rgbHexString),
                    (UIColor.MaterialDeepOrange.i100, "UIColor.MaterialDeepOrange.i100", UIColor.MaterialDeepOrange.i100.rgbString, UIColor.MaterialDeepOrange.i100.rgbHexString),
                    (UIColor.MaterialDeepOrange.i200, "UIColor.MaterialDeepOrange.i200", UIColor.MaterialDeepOrange.i200.rgbString, UIColor.MaterialDeepOrange.i200.rgbHexString),
                    (UIColor.MaterialDeepOrange.i300, "UIColor.MaterialDeepOrange.i300", UIColor.MaterialDeepOrange.i300.rgbString, UIColor.MaterialDeepOrange.i300.rgbHexString),
                    (UIColor.MaterialDeepOrange.i400, "UIColor.MaterialDeepOrange.i400", UIColor.MaterialDeepOrange.i400.rgbString, UIColor.MaterialDeepOrange.i400.rgbHexString),
                    (UIColor.MaterialDeepOrange.i500, "UIColor.MaterialDeepOrange.i500", UIColor.MaterialDeepOrange.i500.rgbString, UIColor.MaterialDeepOrange.i500.rgbHexString),
                    (UIColor.MaterialDeepOrange.i600, "UIColor.MaterialDeepOrange.i600", UIColor.MaterialDeepOrange.i600.rgbString, UIColor.MaterialDeepOrange.i600.rgbHexString),
                    (UIColor.MaterialDeepOrange.i700, "UIColor.MaterialDeepOrange.i700", UIColor.MaterialDeepOrange.i700.rgbString, UIColor.MaterialDeepOrange.i700.rgbHexString),
                    (UIColor.MaterialDeepOrange.i800, "UIColor.MaterialDeepOrange.i800", UIColor.MaterialDeepOrange.i800.rgbString, UIColor.MaterialDeepOrange.i800.rgbHexString),
                    (UIColor.MaterialDeepOrange.i900, "UIColor.MaterialDeepOrange.i900", UIColor.MaterialDeepOrange.i900.rgbString, UIColor.MaterialDeepOrange.i900.rgbHexString),
                    (UIColor.MaterialDeepOrange.a100, "UIColor.MaterialDeepOrange.a100", UIColor.MaterialDeepOrange.a100.rgbString, UIColor.MaterialDeepOrange.a100.rgbHexString),
                    (UIColor.MaterialDeepOrange.a200, "UIColor.MaterialDeepOrange.a200", UIColor.MaterialDeepOrange.a200.rgbString, UIColor.MaterialDeepOrange.a200.rgbHexString),
                    (UIColor.MaterialDeepOrange.a400, "UIColor.MaterialDeepOrange.a400", UIColor.MaterialDeepOrange.a400.rgbString, UIColor.MaterialDeepOrange.a400.rgbHexString),
                    (UIColor.MaterialDeepOrange.a700, "UIColor.MaterialDeepOrange.a700", UIColor.MaterialDeepOrange.a700.rgbString, UIColor.MaterialDeepOrange.a700.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 14, title: "UIColor.MaterialDeepOrange")
            }
            
            list = [(UIColor.MaterialBrown.primary, "UIColor.MaterialBrown.primary", UIColor.MaterialBrown.primary.rgbString, UIColor.MaterialBrown.primary.rgbHexString),
                    (UIColor.MaterialBrown.i50, "UIColor.MaterialBrown.i50", UIColor.MaterialBrown.i50.rgbString, UIColor.MaterialBrown.i50.rgbHexString),
                    (UIColor.MaterialBrown.i100, "UIColor.MaterialBrown.i100", UIColor.MaterialBrown.i100.rgbString, UIColor.MaterialBrown.i100.rgbHexString),
                    (UIColor.MaterialBrown.i200, "UIColor.MaterialBrown.i200", UIColor.MaterialBrown.i200.rgbString, UIColor.MaterialBrown.i200.rgbHexString),
                    (UIColor.MaterialBrown.i300, "UIColor.MaterialBrown.i300", UIColor.MaterialBrown.i300.rgbString, UIColor.MaterialBrown.i300.rgbHexString),
                    (UIColor.MaterialBrown.i400, "UIColor.MaterialBrown.i400", UIColor.MaterialBrown.i400.rgbString, UIColor.MaterialBrown.i400.rgbHexString),
                    (UIColor.MaterialBrown.i500, "UIColor.MaterialBrown.i500", UIColor.MaterialBrown.i500.rgbString, UIColor.MaterialBrown.i500.rgbHexString),
                    (UIColor.MaterialBrown.i600, "UIColor.MaterialBrown.i600", UIColor.MaterialBrown.i600.rgbString, UIColor.MaterialBrown.i600.rgbHexString),
                    (UIColor.MaterialBrown.i700, "UIColor.MaterialBrown.i700", UIColor.MaterialBrown.i700.rgbString, UIColor.MaterialBrown.i700.rgbHexString),
                    (UIColor.MaterialBrown.i800, "UIColor.MaterialBrown.i800", UIColor.MaterialBrown.i800.rgbString, UIColor.MaterialBrown.i800.rgbHexString),
                    (UIColor.MaterialBrown.i900, "UIColor.MaterialBrown.i900", UIColor.MaterialBrown.i900.rgbString, UIColor.MaterialBrown.i900.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 15, title: "UIColor.MaterialBrown")
            }
            
            list = [(UIColor.MaterialGrey.primary, "UIColor.MaterialGrey.primary", UIColor.MaterialGrey.primary.rgbString, UIColor.MaterialGrey.primary.rgbHexString),
                    (UIColor.MaterialGrey.i50, "UIColor.MaterialGrey.i50", UIColor.MaterialGrey.i50.rgbString, UIColor.MaterialGrey.i50.rgbHexString),
                    (UIColor.MaterialGrey.i100, "UIColor.MaterialGrey.i100", UIColor.MaterialGrey.i100.rgbString, UIColor.MaterialGrey.i100.rgbHexString),
                    (UIColor.MaterialGrey.i200, "UIColor.MaterialGrey.i200", UIColor.MaterialGrey.i200.rgbString, UIColor.MaterialGrey.i200.rgbHexString),
                    (UIColor.MaterialGrey.i300, "UIColor.MaterialGrey.i300", UIColor.MaterialGrey.i300.rgbString, UIColor.MaterialGrey.i300.rgbHexString),
                    (UIColor.MaterialGrey.i400, "UIColor.MaterialGrey.i400", UIColor.MaterialGrey.i400.rgbString, UIColor.MaterialGrey.i400.rgbHexString),
                    (UIColor.MaterialGrey.i500, "UIColor.MaterialGrey.i500", UIColor.MaterialGrey.i500.rgbString, UIColor.MaterialGrey.i500.rgbHexString),
                    (UIColor.MaterialGrey.i600, "UIColor.MaterialGrey.i600", UIColor.MaterialGrey.i600.rgbString, UIColor.MaterialGrey.i600.rgbHexString),
                    (UIColor.MaterialGrey.i700, "UIColor.MaterialGrey.i700", UIColor.MaterialGrey.i700.rgbString, UIColor.MaterialGrey.i700.rgbHexString),
                    (UIColor.MaterialGrey.i800, "UIColor.MaterialGrey.i800", UIColor.MaterialGrey.i800.rgbString, UIColor.MaterialGrey.i800.rgbHexString),
                    (UIColor.MaterialGrey.i900, "UIColor.MaterialGrey.i900", UIColor.MaterialGrey.i900.rgbString, UIColor.MaterialGrey.i900.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 16, title: "UIColor.MaterialGrey")
            }
            
            list = [(UIColor.MaterialBlueGrey.primary, "UIColor.MaterialBlueGrey.primary", UIColor.MaterialBlueGrey.primary.rgbString, UIColor.MaterialBlueGrey.primary.rgbHexString),
                    (UIColor.MaterialBlueGrey.i50, "UIColor.MaterialBlueGrey.i50", UIColor.MaterialBlueGrey.i50.rgbString, UIColor.MaterialBlueGrey.i50.rgbHexString),
                    (UIColor.MaterialBlueGrey.i100, "UIColor.MaterialBlueGrey.i100", UIColor.MaterialBlueGrey.i100.rgbString, UIColor.MaterialBlueGrey.i100.rgbHexString),
                    (UIColor.MaterialBlueGrey.i200, "UIColor.MaterialBlueGrey.i200", UIColor.MaterialBlueGrey.i200.rgbString, UIColor.MaterialBlueGrey.i200.rgbHexString),
                    (UIColor.MaterialBlueGrey.i300, "UIColor.MaterialBlueGrey.i300", UIColor.MaterialBlueGrey.i300.rgbString, UIColor.MaterialBlueGrey.i300.rgbHexString),
                    (UIColor.MaterialBlueGrey.i400, "UIColor.MaterialBlueGrey.i400", UIColor.MaterialBlueGrey.i400.rgbString, UIColor.MaterialBlueGrey.i400.rgbHexString),
                    (UIColor.MaterialBlueGrey.i500, "UIColor.MaterialBlueGrey.i500", UIColor.MaterialBlueGrey.i500.rgbString, UIColor.MaterialBlueGrey.i500.rgbHexString),
                    (UIColor.MaterialBlueGrey.i600, "UIColor.MaterialBlueGrey.i600", UIColor.MaterialBlueGrey.i600.rgbString, UIColor.MaterialBlueGrey.i600.rgbHexString),
                    (UIColor.MaterialBlueGrey.i700, "UIColor.MaterialBlueGrey.i700", UIColor.MaterialBlueGrey.i700.rgbString, UIColor.MaterialBlueGrey.i700.rgbHexString),
                    (UIColor.MaterialBlueGrey.i800, "UIColor.MaterialBlueGrey.i800", UIColor.MaterialBlueGrey.i800.rgbString, UIColor.MaterialBlueGrey.i800.rgbHexString),
                    (UIColor.MaterialBlueGrey.i900, "UIColor.MaterialBlueGrey.i900", UIColor.MaterialBlueGrey.i900.rgbString, UIColor.MaterialBlueGrey.i900.rgbHexString)]
            
            for color in list {
                let item = ColorItem(color: color.0, name: color.1, rgb: color.2, hex: color.3)
                append(item, at: 17, title: "UIColor.MaterialBlueGrey")
            }
        }
        
        
        super.composeList(completion: completion)
    }
}
