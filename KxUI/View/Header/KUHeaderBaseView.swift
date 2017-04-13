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
    @IBOutlet public weak var containerVC: UIViewController!
    
    /// 왼쪽 메뉴 컨테이너뷰
    public lazy var leftContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        //v.backgroundColor = self.backgroundColor
        
        return v
    }()
    
    
    /// 중앙 내용 컨테이너뷰
    public lazy var centerContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = false
        //v.backgroundColor = self.backgroundColor
        
        return v
    }()

    
    /// 오른쪽 메뉴 컨테이너뷰
    public lazy var rightContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        //v.backgroundColor = self.backgroundColor
        
        return v
    }()
    
    @IBInspectable
    open var leftContainerWidth: CGFloat = 70 {
        didSet {
            leftContainerWidthConstraint.constant = leftContainerWidth
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    open var rightContainerWidth: CGFloat = 70 {
        didSet {
            rightContainerWidthConstraint.constant = rightContainerWidth
            layoutIfNeeded()
        }
    }
    
    @IBInspectable
    open var excludeStatusBarArea: Bool = true {
        didSet {
            leftContainerTopConstraint.constant = excludeStatusBarArea ? UIApplication.shared.statusBarFrame.height : 0.0
            centerContainerTopConstraint.constant = leftContainerTopConstraint.constant
            rightContainerTopConstraint.constant = leftContainerTopConstraint.constant
            layoutIfNeeded()
        }
    }
    
    private var leftContainerWidthConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: leftContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: leftContainerWidth)
    }
    private var rightContainerWidthConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: rightContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: rightContainerWidth)
    }
    
    private var leftContainerTopConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: leftContainerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: excludeStatusBarArea ? UIApplication.shared.statusBarFrame.height : 0.0)
    }
    private var centerContainerTopConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: centerContainerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: excludeStatusBarArea ? UIApplication.shared.statusBarFrame.height : 0.0)
    }
    private var rightContainerTopConstraint: NSLayoutConstraint {
        return NSLayoutConstraint(item: rightContainerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: excludeStatusBarArea ? UIApplication.shared.statusBarFrame.height : 0.0)
    }
    
    override func setup() {
        super.setup()
        
        let views: [String: Any] = ["leftContainerView": leftContainerView,
                                    "centerContainerView": centerContainerView,
                                    "rightContainerView": rightContainerView]
        
        addSubview(leftContainerView)
        addSubview(rightContainerView)
        addSubview(centerContainerView)
        
        let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[leftContainerView][centerContainerView][rightContainerView]|", options: [], metrics: nil, views: views)
        //print(horzConstraints)
        addConstraints(horzConstraints)
        
        var vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[leftContainerView]|", options: [], metrics: nil, views: views)
        addConstraints(vertConstraints)
        
        vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[rightContainerView]|", options: [], metrics: nil, views: views)
        addConstraints(vertConstraints)
        
        vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[centerContainerView]|", options: [], metrics: nil, views: views)
        addConstraints(vertConstraints)
        
        addConstraint(leftContainerWidthConstraint)
        addConstraint(rightContainerWidthConstraint)
        addConstraint(leftContainerTopConstraint)
        addConstraint(centerContainerTopConstraint)
        addConstraint(rightContainerTopConstraint)
       
    }
}
