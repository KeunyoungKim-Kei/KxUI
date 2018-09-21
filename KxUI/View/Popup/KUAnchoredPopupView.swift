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


@IBDesignable open class KUAnchoredPopupView: UIView {
    static var list = [KUAnchoredPopupView]()
    
    @IBInspectable open var cornerRadius: CGFloat = 2 {
        didSet {
            setupView()
        }
    }
    
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            setupView()
        }
    }
    
    
    @IBInspectable open var anchorHeight: CGFloat = 6  {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable open var text: String? {
        didSet {
            label.text = text
        }
    }
    
    @IBInspectable open var fontSize: CGFloat = 10 {
        didSet {
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    @IBInspectable open var triangleOffset: CGFloat = 0 {
        didSet {
            triangleViewCenterXConstraint?.constant = triangleOffset
        }
    }
    
    var triangleViewCenterXConstraint: NSLayoutConstraint? = nil
    
    @IBInspectable open var popupColor: UIColor = UIColor.red {
        didSet {
            _ = subviews.map { $0.backgroundColor = popupColor }
        }
    }
    
    @IBInspectable open var textColor: UIColor = UIColor.white {
        didSet {
            label.textColor = textColor
        }
    }
    
    @IBInspectable open var insets: UIEdgeInsets = UIEdgeInsets(top: 3, left: 6, bottom: 3, right: 6) {
        didSet {
            setupView()
        }
    }
    
    open var label = UILabel()
    
    open override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    open override func awakeFromNib() {
        setupView()
        KUAnchoredPopupView.list.append(self)
    }
    
    override public init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        
        setupView()
        KUAnchoredPopupView.list.append(self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open var anchorView: UIView?
    
    open func show(in view: UIView, anchor: UIView, centerOffset: CGFloat = 0.0, topMargin: CGFloat = 0.0) {
        defer {
            for index in 0..<KUAnchoredPopupView.list.count - 1 {
                KUAnchoredPopupView.list[index].dismiss()
            }
            
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        for v in KUAnchoredPopupView.list {
            if v.anchorView == .some(anchor) {
                return
            }
        }
        
        anchorView = anchor
        
        self.alpha = 0.0
        view.addSubview(self)
                
        let centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: anchor, attribute: .centerX, multiplier: 1.0, constant: centerOffset)
        view.addConstraint(centerX)
        
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: anchor, attribute: .bottom, multiplier: 1.0, constant: topMargin)
        view.addConstraint(top)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.alpha = 1.0
        }
    }
    
    public static func dismissAll(animated: Bool = true) {
        for view in KUAnchoredPopupView.list {
            UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
                view.alpha = 0.0
            }) { (finished) in
                view.removeFromSuperview()
            }
        }
        
        KUAnchoredPopupView.list.removeAll()
    }

    @objc open func dismiss(animated: Bool = true) {
        if let index = KUAnchoredPopupView.list.index(of: self) {
            UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: { [weak self] in
                self?.alpha = 0.0
            }) { [weak self] (finished) in
                self?.removeFromSuperview()
                KUAnchoredPopupView.list.remove(at: index)
            }
        }
    }
    
    open func hide(after: DispatchTime = .now() + 2, disableTap: Bool = true) {
        isUserInteractionEnabled = !disableTap
        
        DispatchQueue.main.asyncAfter(deadline: after) { [weak self] in
            self?.dismiss()
        }
    }
    
    func setupView() {
        removeConstraints(constraints)
        _ = subviews.map { $0.removeFromSuperview() }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        //v.isUserInteractionEnabled = false
        v.clipsToBounds = true
        v.backgroundColor = popupColor
        v.layer.cornerRadius = cornerRadius
        
        addSubview(v)
        
        var views = ["v": v]
        var horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[v]|", options: [], metrics: nil, views: views)
        addConstraints(horzConstraints)
        
        let metrics = ["top": anchorHeight / 2, "height": anchorHeight]
        var vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[v]|", options: [], metrics: metrics, views: views)
        addConstraints(vertConstraints)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
      #if swift(>=4.0)
         label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
         label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
         label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
         label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
      #else
         label.setContentCompressionResistancePriority(1000, for: .horizontal)
         label.setContentCompressionResistancePriority(1000, for: .vertical)
         label.setContentHuggingPriority(1000, for: .horizontal)
         label.setContentHuggingPriority(1000, for: .vertical)
      #endif
      
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = textColor
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.size.width - insets.left - insets.right
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        //label.backgroundColor = UIColor.black
        //label.sizeToFit()
        
        v.addSubview(label)
        
        let labelMetrics = ["top": insets.top, "left": insets.left, "right": insets.right, "bottom": insets.bottom]
        horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-left-[lbl]-right-|", options: [], metrics: labelMetrics, views: ["lbl": label])
        v.addConstraints(horzConstraints)
        
        vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[lbl]-bottom-|", options: [], metrics: labelMetrics, views: ["lbl": label])
        v.addConstraints(vertConstraints)
        
        let triangleView = UIView()
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        triangleView.isUserInteractionEnabled = false
        triangleView.clipsToBounds = true
        triangleView.backgroundColor = popupColor
        
        #if swift(>=3.1)
        let rotation = CGAffineTransform(rotationAngle: CGFloat(Double.pi) / 4.0)
        #else
        let rotation = CGAffineTransform(rotationAngle: CGFloat(M_PI) / 4.0)
        #endif
        
        triangleView.transform = rotation
        
        insertSubview(triangleView, belowSubview: v)
        
        let center = NSLayoutConstraint(item: triangleView, attribute: .centerX, relatedBy: .equal, toItem: v, attribute: .centerX, multiplier: 1.0, constant: triangleOffset)
        addConstraint(center)
        triangleViewCenterXConstraint = center
        
        let width = NSLayoutConstraint(item: triangleView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: anchorHeight)
        addConstraint(width)
        
        views = ["v": triangleView]
        vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v(height)]", options: [], metrics: metrics, views: views)
        addConstraints(vertConstraints)
        
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        btn.setTitle(nil, for: .normal)
        
        v.insertSubview(btn, belowSubview: label)
        
        views = ["btn": btn]
        horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|[btn]|", options: [], metrics: nil, views: views)
        v.addConstraints(horzConstraints)
        
        vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[btn]|", options: [], metrics: nil, views: views)
        v.addConstraints(vertConstraints)
        
        
    }
}
