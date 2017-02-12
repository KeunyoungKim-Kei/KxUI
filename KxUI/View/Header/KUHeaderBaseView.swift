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

open class KUHeaderBaseView: KUUnderlineView {
    /// 왼쪽 메뉴 컨테이너뷰
    lazy var leftContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = self.backgroundColor
        
        return v
    }()
    
    
    /// 중앙 내용 컨테이너뷰
    lazy var centerContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = false
        v.backgroundColor = self.backgroundColor
        v.backgroundColor = UIColor.red
        
        
        return v
    }()

    
    /// 오른쪽 메뉴 컨테이너뷰
    lazy var rightContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = self.backgroundColor
        
        return v
    }()
    
    @IBInspectable
    open var leftContainerWidth: CGFloat = 70 {
        didSet {
            leftContainerWidthConstraint?.constant = leftContainerWidth
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    open var rightContainerWidth: CGFloat = 70 {
        didSet {
            rightContainerWidthConstraint?.constant = rightContainerWidth
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    open var excludeStatusBarArea: Bool = true {
        didSet {
            setup()
        }
    }
    
    private var leftContainerWidthConstraint: NSLayoutConstraint?
    
    private var rightContainerWidthConstraint: NSLayoutConstraint?
    
    override func setup() {
        super.setup()
        
        var views: [String: Any] = ["leftContainerView": leftContainerView,
                                    "centerContainerView": centerContainerView,
                                    "rightContainerView": rightContainerView]
        
        addSubview(leftContainerView)
        addSubview(rightContainerView)
        addSubview(centerContainerView)
        
        let metrics = ["top": excludeStatusBarArea ? UIApplication.shared.statusBarFrame.height : 0.0]
        
        var horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[leftContainerView][centerContainerView][rightContainerView]|", options: [], metrics: nil, views: views)
        addConstraints(horzConstraints)
        
        var vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[leftContainerView]|", options: [], metrics: metrics, views: views)
        addConstraints(vertConstraints)
        
        vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[rightContainerView]|", options: [], metrics: metrics, views: views)
        addConstraints(vertConstraints)
        
        vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[centerContainerView]|", options: [], metrics: metrics, views: views)
        addConstraints(vertConstraints)
        
        leftContainerWidthConstraint = NSLayoutConstraint(item: leftContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: leftContainerWidth)
        if let constraint = leftContainerWidthConstraint {
            addConstraint(constraint)
        }
        
        rightContainerWidthConstraint = NSLayoutConstraint(item: rightContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: rightContainerWidth)
        if let constraint = rightContainerWidthConstraint {
            addConstraint(constraint)
        }
        
       
    }
}
