//
//  KUUnderlineView.swift
//  Pods
//
//  Created by Keun young Kim on 2017. 2. 12..
//
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
    
    lazy var bottomLineView: UIView = {
        let v = UIView()
        v.isUserInteractionEnabled = false
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = self.bottomLineColor
        
        return v
    }()
    
    func setup() {
        var views: [String: Any] = ["bottomLine": bottomLineView]
        
        addSubview(bottomLineView)
        
        let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[bottomLine]|", options: [], metrics: nil, views: views)
        addConstraints(horzConstraints)
        
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomLine]|", options: [], metrics: nil, views: views)
        addConstraints(vertConstraints)
        
        bottomLineHeightConstraint = NSLayoutConstraint(item: bottomLineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: bottomLineHeight)
        if let constraint = bottomLineHeightConstraint {
            addConstraint(constraint)
        }        
    }
    
    open override func prepareForInterfaceBuilder() {
        setup()
    }
    
    open override func awakeFromNib() {
        setup()
    }
}
