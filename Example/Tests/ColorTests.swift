//
//  Copyright (c) 2016 Keun young Kim <app@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import XCTest
import KxUI

class ColorTests: XCTestCase {
    
    let validList = ["#123", "#000", "#fff", "#112233", "#FF0000", "#FFFF00", "#FF00FF", "#FF00FFFF", "#f00F"]
    let invalidList = ["#1234s", "#zzz", "#ffffs", "#11aa33a", "#FF00F", "fff", "FFFFFF"]
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - String+Color.swift
    
    func testVaidHexColorString() {
        for value in validList {
            XCTAssertTrue(value.isHexColorString)
            XCTAssertNotNil(value.parseHexColorString())
            XCTAssertNotNil(value.UIColorValue)
        }
    }
    
    func testInvaidHexColorString() {
        for value in invalidList {
            XCTAssertFalse(value.isHexColorString)
            XCTAssertNil(value.parseHexColorString())
            XCTAssertNil(value.UIColorValue)
        }
    }
    
    func testHexStringComponents() {
        for value in validList {
            XCTAssertNotNil(value.redComponent)
            XCTAssertGreaterThanOrEqual(value.redComponent!, 0)
            XCTAssertLessThanOrEqual(value.redComponent!, 255)
            
            XCTAssertNotNil(value.greenComponent)
            XCTAssertGreaterThanOrEqual(value.greenComponent!, 0)
            XCTAssertLessThanOrEqual(value.greenComponent!, 255)
            
            XCTAssertNotNil(value.blueComponent)
            XCTAssertGreaterThanOrEqual(value.blueComponent!, 0)
            XCTAssertLessThanOrEqual(value.blueComponent!, 255)
            
            XCTAssertNotNil(value.alphaComponent)
            XCTAssertGreaterThanOrEqual(value.alphaComponent ?? 0, 0)
            XCTAssertLessThanOrEqual(value.alphaComponent ?? 255, 255)
        }
    }
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - UIColor+RGB.swift
    
    let validNormalizedRGBAComponentList = [[0.16, 0.33, 0.94, 0.53],
                                 [0.97, 0.12, 0.86, 0.4],
                                 [0.64, 0.0, 0.72, 0.2],
                                 [0.0, 0.47, 0.85, 0.57],
                                 [0.65, 0.41, 0.55, 0.75],
                                 [0.76, 0.74, 0.33, 0.03],
                                 [0.48, 0.12, 0.19, 0.52],
                                 [0.3, 0.45, 0.48, 0.12],
                                 [0.03, 0.04, 0.5, 0.26],
                                 [0.61, 0.08, 0.84, 0.23]]
    
    let invalidNormalizedRGBAComponentList = [[0.16, 1.33, 0.94, 0.53],
                                  [0.97, 1.12, 0.86, 0.4],
                                  [0.64, 1.10, 0.72, 0.2],
                                  [0.0, 1.47, 0.85, 0.57],
                                  [0.65, 1.41, 0.55, 0.75],
                                  [0.76, 1.74, 0.33, 0.03],
                                  [0.48, 1.12, 0.19, 0.52],
                                  [0.3, 1.45, 0.48, 0.12],
                                  [0.03, 1.04, 0.5, 0.26],
                                  [0.61, 1.08, 0.84, 0.23]]
    
    let validNormalizedRGBComponentList = [[0.55, 0.18, 0.52],
                                 [0.18, 0.38, 0.94],
                                 [0.19, 0.85, 0.32],
                                 [0.17, 0.7, 0.99],
                                 [0.93, 0.54, 0.09],
                                 [0.15, 0.28, 0.99],
                                 [0.11, 0.23, 0.69],
                                 [0.13, 0.0, 0.94],
                                 [0.68, 0.39, 0.72],
                                 [0.32, 0.85, 0.71]]
    
    let invalidNormalizedRGBComponentList = [[0.55, 1.18, 0.52],
                                 [0.18, 1.38, 0.94],
                                 [0.19, 1.85, 0.32],
                                 [0.17, 1.7, 0.99],
                                 [0.93, 1.54, 0.09],
                                 [0.15, 1.28, 0.99],
                                 [0.11, 1.23, 0.69],
                                 [0.13, 1.10, 0.94],
                                 [0.68, 1.39, 0.72],
                                 [0.32, 1.85, 0.71]]
    
    let validRGBAComponentList = [[226, 189, 41, 56],
                                  [59, 113, 134, 52],
                                  [191, 26, 151, 108],
                                  [203, 119, 124, 191],
                                  [175, 120, 28, 141],
                                  [231, 14, 39, 200],
                                  [90, 169, 15, 51],
                                  [203, 11, 146, 170],
                                  [79, 140, 6, 177],
                                  [34, 152, 136, 143]]
    
    let invalidRGBAComponentList = [[226, 189, 411, 56],
                                    [59, 113, -134, 52],
                                    [191, 26, 1251, 108],
                                    [203, 119, -124, 191],
                                    [175, 120, 328, 141],
                                    [231, 14, -39, 200],
                                    [90, 169, 415, 51],
                                    [203, 11, -146, 170],
                                    [79, 140, 556, 177],
                                    [34, 152, -136, 143]]
    
    let validRGBComponentList = [[226, 41, 56],
                                  [59, 113, 52],
                                  [26, 151, 108],
                                  [119, 124, 191],
                                  [120, 28, 141],
                                  [231, 39, 200],
                                  [90, 15, 51],
                                  [203, 11, 170],
                                  [79, 140, 6],
                                  [34, 152, 143]]
    
    let invalidRGBComponentList = [[226, 411, 56],
                                    [59, -134, 52],
                                    [191, 1251, 108],
                                    [203, -124, 191],
                                    [175, 328, 141],
                                    [231, -39, 200],
                                    [90, 415, 51],
                                    [203, -146, 170],
                                    [79, 556, 177],
                                    [34, -136, 143]]
    
    func testConvenienceInitializers() {
        for list in validNormalizedRGBAComponentList {
            var result1 = UIColor(normalizedRgbaComponents: list)
            XCTAssertNotNil(result1)
            
            result1 = UIColor(normalizedRgbComponents: list)
            XCTAssertNil(result1)
        }
        
        for list in invalidNormalizedRGBAComponentList {
            let result1 = UIColor(normalizedRgbaComponents: list)
            XCTAssertNil(result1)
        }
        
        for list in validNormalizedRGBComponentList {
            var result2 = UIColor(normalizedRgbComponents: list)
            XCTAssertNotNil(result2)
            
            result2 = UIColor(normalizedRgbaComponents: list)
            XCTAssertNil(result2)
        }
        
        for list in invalidNormalizedRGBComponentList {
            let result2 = UIColor(normalizedRgbComponents: list)
            XCTAssertNil(result2)
        }
        
        for list in validRGBAComponentList {
            var result = UIColor(rgbaComponents: list)
            XCTAssertNotNil(result)
            
            result = UIColor(rgbComponents: list)
            XCTAssertNil(result)
        }
        
        for list in invalidRGBAComponentList {
            let result = UIColor(rgbaComponents: list)
            XCTAssertNil(result)
        }
        
        for list in validRGBComponentList {
            var result = UIColor(rgbComponents: list)
            XCTAssertNotNil(result)
            
            result = UIColor(rgbaComponents: list)
            XCTAssertNil(result)
        }
        
        for list in invalidRGBComponentList {
            let result = UIColor(rgbComponents: list)
            XCTAssertNil(result)
        }
    }
    
    
    func testNormalizedRGBAComponents() {
        for list in validNormalizedRGBAComponentList {
            if let color = UIColor(normalizedRgbaComponents: list) {
                XCTAssertEqual(color.normalizedRedComponent ?? -1, CGFloat(list[0]))
                XCTAssertEqual(color.normalizedGreenComponent ?? -1, CGFloat(list[1]))
                XCTAssertEqual(color.normalizedBlueComponent ?? -1, CGFloat(list[2]))
                XCTAssertEqual(color.normalizedAlphaComponent ?? -1, CGFloat(list[3]))
                
                let result = color.normalizedRGBAComponent
                XCTAssertEqual(result?.r ?? -1, CGFloat(list[0]))
                XCTAssertEqual(result?.g ?? -1, CGFloat(list[1]))
                XCTAssertEqual(result?.b ?? -1, CGFloat(list[2]))
                XCTAssertEqual(result?.a ?? -1, CGFloat(list[3]))
            } else {
                XCTFail()
            }
        }
    }
    
    
    func testRGBAComponents() {
        for list in validRGBAComponentList {
            if let color = UIColor(rgbaComponents: list) {
                XCTAssertEqual(color.redComponent ?? -1, CGFloat(list[0]))
                XCTAssertEqual(color.greenComponent ?? -1, CGFloat(list[1]))
                XCTAssertEqual(color.blueComponent ?? -1, CGFloat(list[2]))
                XCTAssertEqual(color.alphaComponent ?? -1, CGFloat(list[3]))
                
                let result = color.rgbaComponent
                XCTAssertEqual(result?.r ?? -1, list[0])
                XCTAssertEqual(result?.g ?? -1, list[1])
                XCTAssertEqual(result?.b ?? -1, list[2])
                XCTAssertEqual(result?.a ?? -1, list[3])
            } else {
                XCTFail()
            }
        }
    }
    
    
    func testUIColorCompare() {
        for color in validList {
            let color1 = UIColor(red: color.redComponent!/255.0,
                                 green: color.greenComponent!/255.0,
                                 blue: color.blueComponent!/255.0,
                                 alpha: (color.alphaComponent ?? 255.0)/255.0)
            let color2 = UIColor(hexString: color)
            
            XCTAssertEqual(color1, color2)
        }
    }
    
    
    func testComponents() {
        let hex = "#37F"
        
        if let r = hex.redComponent {
            XCTAssertEqual(r, 0x33)
        }
        
        if let g = hex.greenComponent {
            XCTAssertEqual(g, 0x77)
        }
        
        if let b = hex.blueComponent {
            XCTAssertEqual(b, 0xFf)
        }
        
        let hex22 = "#37FA"
        
        if let r = hex22.redComponent {
            XCTAssertEqual(r, 0x33)
        }
        
        if let g = hex22.greenComponent {
            XCTAssertEqual(g, 0x77)
        }
        
        if let b = hex22.blueComponent {
            XCTAssertEqual(b, 0xff)
        }
        
        if let a = hex22.alphaComponent {
            XCTAssertEqual(a, 0xaa)
        }
        
        let hex2 = "#AABBCC"
        
        if let r = hex2.redComponent {
            XCTAssertEqual(r, 0xaa)
        }
        
        if let g = hex2.greenComponent {
            XCTAssertEqual(g, 0xbb)
        }
        
        if let b = hex2.blueComponent {
            XCTAssertEqual(b, 0xcc)
        }
        
        let hex3 = "#F0ABDC78"
        
        if let r = hex3.redComponent {
            XCTAssertEqual(r, 0xf0)
        }
        
        if let g = hex3.greenComponent {
            XCTAssertEqual(g, 0xab)
        }
        
        if let b = hex3.blueComponent {
            XCTAssertEqual(b, 0xdc)
        }
        
        if let a = hex3.alphaComponent {
            XCTAssertEqual(a, 0x78)
        }
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - UIColor+Hex.swift
    
    let hexList = ["#F44336", "#FFEBEE", "#FFCDD2", "#EF9A9A", "#E57373", "#EF5350", "#F44336"]
    let hexList2 = ["#F44336FF", "#FFEBEEAC", "#FFCDD212", "#EF9A9A76", "#E5737302", "#EF535050", "#F44336AA"]
    
    func testStringConversion() {
        for str in hexList {
            let color = UIColor(hexString: str)
            XCTAssertEqual(str, color.rgbHexString)
        }
        
        for str in hexList2 {
            let color = UIColor(hexString: str)
            XCTAssertEqual(str, color.rgbaHexString)
        }
    }
}

