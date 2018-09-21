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

@IBDesignable open class KUColoredButton: KURoundButton {
   
   @IBInspectable
   open dynamic var buttonColor: UIColor {
      get { return _buttonColor }
      set { _buttonColor = newValue }
   }
   
   private var _buttonColor: UIColor = UIColor.Apple.blue {
      didSet {
         setupView()
      }
   }
   
   @IBInspectable
   open dynamic var highlightedColor: UIColor?  {
      get { return _highlightedColor }
      set { _highlightedColor = newValue }
   }
   
   private var _highlightedColor: UIColor?  {
      didSet {
         setupView()
      }
   }
   
   @IBInspectable
   open dynamic var disabledColor: UIColor?  {
      get { return _disabledColor }
      set { _disabledColor = newValue }
   }
   
   private var _disabledColor: UIColor?  {
      didSet {
         setupView()
      }
   }
   
   override func setupView() {
      super.setupView()
      
      if let backgroundImage = UIImage.generate(from: _buttonColor, size: bounds.size) {
         setBackgroundImage(backgroundImage, for: .normal)
      }
      
      setBackgroundImage(nil, for: .highlighted)
      if let color = _highlightedColor, let img = UIImage.generate(from: color, size: bounds.size) {
         setBackgroundImage(img, for: .highlighted)
      }
      
      setBackgroundImage(nil, for: .disabled)
      if let color = _disabledColor, let img = UIImage.generate(from: color, size: bounds.size) {
         setBackgroundImage(img, for: .disabled)
      }
   }
}
