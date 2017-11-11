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

import UIKit

public extension UITextField {
    public func validate(minLength min: Int = 1, maxLength max: Int = Int.max) -> String? {
      #if swift(>=3.2)
         guard let value = self.text, value.count >= min && value.count <= max else {
            return nil
         }
      #else
         guard let value = self.text, value.characters.count >= min && value.characters.count <= max else {
            return nil
         }
      #endif
      
        
        return value
    }
}

public extension UITextView {
    public func validate(minLength min: Int = 1, maxLength max: Int = Int.max) -> String? {
      #if swift(>=3.2)
         guard let value = self.text, value.count >= min && value.count <= max else {
            return nil
         }
      #else
         guard let value = self.text, value.characters.count >= min && value.characters.count <= max else {
            return nil
         }
      #endif
      
        
        return value
    }
}
