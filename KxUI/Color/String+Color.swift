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


public extension String {
   
   private var len: Int {
      #if swift(>=3.2)
         return count
      #else
         return characters.count
      #endif
   }

    /// A Boolean value that indicates whether the receiver is hexadecimal color string
    public var isHexColorString: Bool {
        if !hasPrefix("#") || len < 4 || len > 9 {
            return false
        }
        
        do {
            let pattern = "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}|[A-Fa-f0-9]{4}|[A-Fa-f0-9]{8})$"
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(location: 0, length: len)
            return regex.numberOfMatches(in: self, options: [], range: range) == 1
        } catch {
            print(error)
        }
        
        return false
    }
    
    
    /// The red component of the hexadecimal color string
    public var redComponent: CGFloat? {
        guard isHexColorString else { return nil }
      
        switch len {
        case 4, 5:
            return parse(subRange: 1...2)
        case 7, 9:
            return parse(subRange: 1...3)
        default:
            return nil
        }
    }
    
    
    /// The green component of the hexadecimal color string
    public var greenComponent: CGFloat? {
        guard isHexColorString else { return nil }
      
        switch len {
        case 4, 5:
            return parse(subRange: 2...3)
        case 7, 9:
            return parse(subRange: 3...5)
        default:
            return nil
        }
    }
    
    
    /// The blue component of the hexadecimal color string
    public var blueComponent: CGFloat? {
        guard isHexColorString else { return nil }
        
        switch len {
        case 4, 5:
            return parse(subRange: 3...4)
        case 7, 9:
            return parse(subRange: 5...7)
        default:
            return nil
        }
    }
    
    
    /// The alpha component of the hexadecimal color string
    public var alphaComponent: CGFloat? {
        guard isHexColorString else { return nil }
        
        switch len {
        case 5:
            return parse(subRange: 4...5)
        case 9:
            return parse(subRange: 7...9)
        default:
            return 255.0
        }
    }
    
    
    /// The receiver's UIColor representation
    public var UIColorValue: UIColor? {
        return parseHexColorString()
    }
    
    
    /// Parse the content of receiver.
    ///
    /// The method can parse following format:
    /// - RGB
    /// - RGBA
    /// - RRGGBB
    /// - RRGGBBAA
    ///
    /// - Returns: The UIColor object for the parsed string, or nil if there is an error of if receiver is not a valid hexadecimal color string
    public func parseHexColorString() -> UIColor? {
        if let r = redComponent, let g = greenComponent, let b = blueComponent {
            let a = alphaComponent ?? 255
            
            return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/255.0)
        }
        
        return nil
    }
    
    
    /// Parse the content of specific range.
    ///
    /// - Parameter subRange: range to parse
    /// - Returns: The floating-point value, or nil if the content of specified range cannot be parsed
    fileprivate func parse(subRange: CountableClosedRange<Int>) -> CGFloat? {
        let substringRange = Range<String.Index>(uncheckedBounds: (index(startIndex, offsetBy: subRange.lowerBound), index(startIndex, offsetBy: subRange.upperBound)))
      
      #if swift(>=4.0)
        var value = String(self[substringRange])
      #else
         var value = substring(with: substringRange)
      #endif
      
      
      #if swift(>=3.2)
         if value.count == 1 {
            value = value + value
         }
      #else
         if value.characters.count == 1 {
            value = value + value
         }
      #endif
      
        
        var result: UInt32 = 0
        let scanner = Scanner(string: value)
        if scanner.scanHexInt32(&result) {
            return CGFloat(result)
        }
        
        return nil
    }
}
