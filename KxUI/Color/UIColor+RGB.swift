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

import Foundation

public extension UIColor {
    /**
    Initializes and returns a color object using the elements of the Array
     
     - Parameter list: RGBA component values
    */
    convenience init?(normalizedRgbaComponents list: [Double]) {
        guard list.count == 4 else {
            return nil
        }
        
        for value in list {
            if value < 0.0 || value > 1.0 {
                return nil
            }
        }
        
        let red   = CGFloat(list[0])
        let green = CGFloat(list[1])
        let blue  = CGFloat(list[2])
        let alpha = CGFloat(list[3])
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    /**
    
     - Parameter list: 
    */
    convenience init?(normalizedRgbComponents list: [Double]) {
        guard list.count == 3 else {
            return nil
        }
        
        var rgbaList = list
        rgbaList.append(1.0)
        
        self.init(normalizedRgbaComponents: rgbaList)
    }
    
    /**
    
     - Parameter list: 
    */
    convenience init?(rgbaComponents list: [Int]) {
        guard list.count == 4 else {
            return nil
        }
        
        let list = list.map { Double($0) / 255.0 }
        
        self.init(normalizedRgbaComponents: list)
    }
    
    /**
    
     - Parameter list: 
    */
    convenience init?(rgbComponents list: [Int]) {
        guard list.count == 3 else {
            return nil
        }
        
        let list = list.map { Double($0) / 255.0 }
        
        self.init(normalizedRgbComponents: list)
    }
    
    convenience init?(whiteComponent: Int) {
        self.init(rgbComponents: [whiteComponent, whiteComponent, whiteComponent])
    }
    
    /// 
    var normalizedRGBAComponent: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)? {
        var normalizedR: CGFloat = 0
        var normalizedG: CGFloat = 0
        var normalizedB: CGFloat = 0
        var normalizedA: CGFloat = 0
        
        if getRed(&normalizedR, green: &normalizedG, blue: &normalizedB, alpha: &normalizedA) {
            return (normalizedR, normalizedG, normalizedB, normalizedA)
        }
        
        return nil
    }
    
    var rgbaComponent: (r: Int, g: Int, b: Int, a: Int)? {
        var normalizedR: CGFloat = 0
        var normalizedG: CGFloat = 0
        var normalizedB: CGFloat = 0
        var normalizedA: CGFloat = 0
        
        if getRed(&normalizedR, green: &normalizedG, blue: &normalizedB, alpha: &normalizedA) {
            return (Int(normalizedR * 255.0), Int(normalizedG * 255.0), Int(normalizedB * 255.0), Int(normalizedA * 255.0))
        }
        
        return nil
    }
    
    
    /// The red component of the hexadecimal color string
    var normalizedRedComponent: CGFloat? {
        return normalizedRGBAComponent?.r
    }
    
    /// 
    var redComponent: CGFloat? {
        if let value = normalizedRGBAComponent?.r {
            return value * 255
        }
        
        return nil
    }
    
    
    /// The green component of the hexadecimal color string
    var normalizedGreenComponent: CGFloat? {
        return normalizedRGBAComponent?.g
    }
    
    /// 
    var greenComponent: CGFloat? {
        if let value = normalizedRGBAComponent?.g {
            return value * 255
        }
        
        return nil
    }
    
    
    /// The blue component of the hexadecimal color string
    var normalizedBlueComponent: CGFloat? {
        return normalizedRGBAComponent?.b
    }
    
    /// 
    var blueComponent: CGFloat? {
        if let value = normalizedRGBAComponent?.b {
            return value * 255
        }
        
        return nil
    }
    
    
    /// The alpha component of the hexadecimal color string
    var normalizedAlphaComponent: CGFloat? {
        return normalizedRGBAComponent?.a
    }
    
    /// 
    var alphaComponent: CGFloat? {
        if let value = normalizedRGBAComponent?.a {
            return value * 255
        }
        
        return nil
    }
    
 
    /// 
    var rgbString: String {
        return toRGBString(includeAlpha: false)
    }
    
    
    /// 
    var rgbaString: String {
        return toRGBString(includeAlpha: true)
    }
    
    /**
    
     - Parameter includeAlpha: 
     - Returns: 문자열
    */
    func toRGBString(includeAlpha: Bool) -> String {
        var normalizedR: CGFloat = 0
        var normalizedG: CGFloat = 0
        var normalizedB: CGFloat = 0
        var normalizedA: CGFloat = 0
        
        getRed(&normalizedR, green: &normalizedG, blue: &normalizedB, alpha: &normalizedA)
        
        let r = Int(normalizedR * 255)
        let g = Int(normalizedG * 255)
        let b = Int(normalizedB * 255)
        let a = Int(normalizedA * 255)
        
        if includeAlpha {
            return "R\(r) G\(g) B\(b) A\(a)"
        }
        
        return "R\(r) G\(g) B\(b)"
    }
}
