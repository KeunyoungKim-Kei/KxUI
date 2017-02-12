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

@IBDesignable open class KURoundView: UIView {
    @IBInspectable open var cornerRadius: CGFloat = 3 {
        didSet {
            setupView()
        }
    }
    
    
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            setupView()
        }
    }
    
    
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            setupView()
        }
    }
    
    
    
    open override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    open override func awakeFromNib() {
        setupView()
    }
    
    
    func setupView() {
        apply(cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor, clipsToBounds: true)
    }
}
