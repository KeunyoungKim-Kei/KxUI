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

@IBDesignable open class KUUnderlineView: UIView {

    @IBInspectable
    open var bottomLineColor: UIColor = UIColor.MaterialGrey.primary {
        didSet {
            bottomLineView.backgroundColor = bottomLineColor
        }
    }
    
    @IBInspectable
    open var bottomLineHidden: Bool = false {
        didSet {
            bottomLineView.isHidden = bottomLineHidden
        }
    }
    
    @IBInspectable
    open var bottomLineHeight: CGFloat = 1.0 {
        didSet {
            bottomLineHeightConstraint?.constant = bottomLineHeight
            layoutIfNeeded()
            bottomLineView.layoutIfNeeded()
        }
    }
    
    var bottomLineHeightConstraint: NSLayoutConstraint?
    
    public lazy var bottomLineView: UIView = {
        let v = UIView()
        v.isUserInteractionEnabled = false
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = self.bottomLineColor
        
        return v
    }()
    
    func setup() {
        let views: [String: Any] = ["bottomLine": bottomLineView]
        
        addSubview(bottomLineView)
        
        let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[bottomLine]|", options: [], metrics: nil, views: views)
        addConstraints(horzConstraints)
        
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomLine]|", options: [], metrics: nil, views: views)
        addConstraints(vertConstraints)
        
        bottomLineHeightConstraint = NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: bottomLineHeight)
        if let constraint = bottomLineHeightConstraint {
            addConstraint(constraint)
        }
        
        bottomLineView.backgroundColor = bottomLineColor
    }
    
    open override func prepareForInterfaceBuilder() {
        setup()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    
    
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setup()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        setup()
//    }
}
