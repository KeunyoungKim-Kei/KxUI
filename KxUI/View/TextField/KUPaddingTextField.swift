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


@IBDesignable open class KUPaddingTextField: UITextField {
    @IBInspectable open var leftPadding: CGFloat = 20 {
        didSet {
            setupView()
        }
    }
    
    
    
    @IBInspectable open var rightPadding: CGFloat = 20 {
        didSet {
            setupView()
        }
    }
    
    
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupView()
    }
    
    
    func setupView() {
        let height = bounds.height
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: height))
        leftViewMode = UITextFieldViewMode.always
        
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: height))
        rightViewMode = UITextFieldViewMode.always
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}