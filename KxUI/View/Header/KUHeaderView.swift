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

public enum HeaderPosition {
    case left
    case center
    case right
}

public typealias HeaderTapHandler = (HeaderPosition) -> ()
public typealias CustomHeaderSetupHandler = (HeaderPosition, UIView) -> Set<HeaderPosition>

public extension Notification.Name {
    public static let KUHeaderLeftButtonTap   = Notification.Name(rawValue: "KUHeaderLeftButtonTapNotification")
    public static let KUHeaderCenterButtonTap = Notification.Name(rawValue: "KUHeaderCenterButtonTapNotification")
    public static let KUHeaderRightButtonTap  = Notification.Name(rawValue: "KUHeaderRightButtonTapNotification")
}


@IBDesignable open class KUHeaderView: KUHeaderBaseView {
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Left
    
    open lazy var leftActionButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(performLeftAction), for: .touchUpInside)
        
        return btn
    }()
    
    open func performLeftAction() {
        tapHandler?(.left)
        NotificationCenter.default.post(name: Notification.Name.KUHeaderLeftButtonTap, object: leftActionButton)
    }
    
    
    @IBInspectable
    open var isLeftActionEnabled = true {
        didSet {
            updateLeftButtonAttributes()
        }
    }
    
    @IBInspectable
    open var leftImage: UIImage? = nil {
        didSet {
            updateLeftButtonAttributes()
        }
    }
    
    @IBInspectable
    open var leftImageOffset: CGPoint = CGPoint.zero {
        didSet {
            updateLeftButtonAttributes()
        }
    }
    
    @IBInspectable
    open var leftTitle: String? = nil {
        didSet {
            updateLeftButtonAttributes()
        }
    }
    
    @IBInspectable
    open var leftTitleOffset: CGPoint = CGPoint.zero {
        didSet {
            updateLeftButtonAttributes()
        }
    }
    
    @IBInspectable
    open var leftTitleColor: UIColor? {
        didSet {
            updateLeftButtonAttributes()
        }
    }
    
    
    open func updateLeftButtonAttributes() {
        leftContainerView.isHidden = !isLeftActionEnabled
        
        guard isLeftActionEnabled else {
            return
        }
        
        if let image = leftImage {
            leftActionButton.setImage(image, for: .normal)
            
            var inset = UIEdgeInsets.zero
            inset.left = leftImageOffset.x
            inset.top = leftImageOffset.y
                        
            leftActionButton.imageEdgeInsets = inset
            
            leftActionButton.setTitle(nil, for: .normal)
            leftActionButton.titleEdgeInsets = UIEdgeInsets.zero
            leftActionButton.setNeedsDisplay()
            
            return
        } else {
            leftActionButton.setImage(nil, for: .normal)
            leftActionButton.imageEdgeInsets = UIEdgeInsets.zero
        }
        
        if let title = leftTitle {
            leftActionButton.setTitle(leftTitle, for: .normal)
            
            var inset = UIEdgeInsets.zero
            inset.left = leftTitleOffset.x
            inset.top = leftTitleOffset.y
            
            leftActionButton.titleEdgeInsets = inset
            
            leftActionButton.setTitleColor(leftTitleColor ?? leftActionButton.tintColor, for: .normal)
            
            leftActionButton.setImage(nil, for: .normal)
            leftActionButton.imageEdgeInsets = UIEdgeInsets.zero
            leftActionButton.setNeedsDisplay()
        } else {
            leftActionButton.setTitle(nil, for: .normal)
            leftActionButton.titleEdgeInsets = UIEdgeInsets.zero
        }
    }
    
        
    open func setupLeftContainer() {
        guard setupHandler?(.left, leftContainerView).contains(.left) != .some(true) else {
            return
        }
        
        let views: [String: Any] = ["lbtn": leftActionButton]
        
        leftContainerView.addSubview(leftActionButton)
        
        let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[lbtn]|", options: [], metrics: nil, views: views)
        leftContainerView.addConstraints(horzConstraints)
        
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[lbtn]|", options: [], metrics: nil, views: views)
        leftContainerView.addConstraints(vertConstraints)
        
        updateLeftButtonAttributes()
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Center
    
    /// 헤더 제목 문자열
    @IBInspectable
    open var headerTitle: String? = "Untitled" {
        didSet {
            updateCenterAttributes()
        }
    }
    
    @IBInspectable
    open var headerTitleColor: UIColor = UIColor.black {
        didSet {
            updateCenterAttributes()
        }
    }
    
    /// 헤더 제목 레이블
    open lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = self.headerTitleColor
        lbl.textAlignment = .center
        lbl.text = self.headerTitle
        
        return lbl
    }()
    
    @IBInspectable
    open var headerTitleLabelBottomMargin: CGFloat = 8 {
        didSet {
            headerTitleLabelBottomConstraint?.constant = headerTitleLabelBottomMargin
            centerContainerView.layoutIfNeeded()
        }
    }
    
    var headerTitleLabelBottomConstraint: NSLayoutConstraint?
    
    
    func updateCenterAttributes() {
        if let image = headerImage {
            headerImageView.isHidden = false
            titleLabel.isHidden = !headerImageView.isHidden
            
            headerImageView.image = image
            
            headerImageViewBottomConstraint?.constant = headerImageViewBottomMargin
            headerImageViewWidthConstraint?.constant = headerImageViewSize.width
            headerImageViewHeightConstraint?.constant = headerImageViewSize.height
            headerImageView.layoutIfNeeded()
            centerContainerView.layoutIfNeeded()
            
            return
        } else {
            headerImageView.isHidden = true
        }
        
        if let title = headerTitle, title.characters.count > 0 {
            titleLabel.isHidden = false
            
            titleLabel.text = headerTitle
            titleLabel.textColor = headerTitleColor
            
            headerTitleLabelBottomConstraint?.constant = -headerTitleLabelBottomMargin
            centerContainerView.layoutIfNeeded()
        } else {
            titleLabel.isHidden = true
        }
    }
    
    
    /// 헤더 이미지
    @IBInspectable
    open var headerImage: UIImage? = nil {
        didSet {
            updateCenterAttributes()
        }
    }
    
    
    /// 헤더 이미지뷰
    open lazy var headerImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.image = self.headerImage
        
        return imgView
    }()
    
    @IBInspectable
    open var headerImageViewBottomMargin: CGFloat = 8 {
        didSet {
            updateCenterAttributes()
        }
    }
    
    @IBInspectable
    open var headerImageViewSize: CGSize = CGSize.zero {
        didSet {
            updateCenterAttributes()
        }
    }
    
    var headerImageViewBottomConstraint: NSLayoutConstraint?
    var headerImageViewWidthConstraint: NSLayoutConstraint?
    var headerImageViewHeightConstraint: NSLayoutConstraint?
    
    
   
    var centerButton: UIButton?
    
    func performCenterAction() {
        tapHandler?(.center)
        NotificationCenter.default.post(name: NSNotification.Name.KUHeaderCenterButtonTap, object: centerButton)
    }
    
    
    
    func setupCenterContainer() {
        guard setupHandler?(.center, centerContainerView).contains(.center) != .some(true) else {
            return
        }
        
        // Center Container
        var views: [String: Any] = ["titleLabel": titleLabel, "titleImageView": headerImageView]
        
        centerContainerView.addSubview(titleLabel)
        centerContainerView.addSubview(headerImageView)
        
        var centerXConstraint = NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: centerContainerView, attribute: .centerX, multiplier: 1.0, constant: 0)
        centerContainerView.addConstraint(centerXConstraint)
        
        headerTitleLabelBottomConstraint = NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: centerContainerView, attribute: .bottom, multiplier: 1.0, constant: -headerTitleLabelBottomMargin)
        if let constraint = headerTitleLabelBottomConstraint {
            centerContainerView.addConstraint(constraint)
        }
        
        
        centerXConstraint = NSLayoutConstraint(item: headerImageView, attribute: .centerX, relatedBy: .equal, toItem: centerContainerView, attribute: .centerX, multiplier: 1.0, constant: 0)
        centerContainerView.addConstraint(centerXConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: headerImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: headerImageViewSize.width)
        headerImageView.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: headerImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: headerImageViewSize.height)
        headerImageView.addConstraint(heightConstraint)
        
        headerImageViewBottomConstraint = NSLayoutConstraint(item: headerImageView, attribute: .bottom, relatedBy: .equal, toItem: centerContainerView, attribute: .bottom, multiplier: 1.0, constant: headerImageViewBottomMargin)
        if let constraint = headerImageViewBottomConstraint {
            centerContainerView.addConstraint(constraint)
        }
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(nil, for: .normal)
        btn.addTarget(self, action: #selector(performCenterAction), for: .touchUpInside)
        centerButton = btn
        
        centerContainerView.addSubview(btn)
        
        views = ["btn": btn]
        
        let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn]|", options: [], metrics: nil, views: views)
        centerContainerView.addConstraints(horzConstraints)
        
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[btn]|", options: [], metrics: nil, views: views)
        centerContainerView.addConstraints(vertConstraints)
        
        updateCenterAttributes()
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Right
    
    open lazy var rightActionButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle(nil, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(performRightAction), for: .touchUpInside)
        
        return btn
    }()
    
    
    open func performRightAction() {
        tapHandler?(.right)
        NotificationCenter.default.post(name: Notification.Name.KUHeaderRightButtonTap, object: rightActionButton)
    }
    
    @IBInspectable
    open var isRightActionEnabled = true {
        didSet {
            updateRightButtonAttributes()
        }
    }
    
    @IBInspectable
    open var rightImage: UIImage? = nil {
        didSet {
            updateRightButtonAttributes()
        }
    }
    
    @IBInspectable
    open var rightImageFrame: CGRect = CGRect.zero {
        didSet {
            updateRightButtonAttributes()
        }
    }
    
    @IBInspectable
    open var rightTitle: String? = nil {
        didSet {
            updateRightButtonAttributes()
        }
    }
    
    @IBInspectable
    open var rightTitleFrame: CGRect = CGRect.zero {
        didSet {
            updateRightButtonAttributes()
        }
    }
    
    @IBInspectable
    open var rightTitleColor: UIColor? {
        didSet {
            updateRightButtonAttributes()
        }
    }
    
    
    open func updateRightButtonAttributes() {
        rightContainerView.isHidden = !isRightActionEnabled
        
        guard isRightActionEnabled else {
            return
        }
        
        if let image = rightImage {
            rightActionButton.setImage(image, for: .normal)
            
            var inset = UIEdgeInsets()
            inset.left = rightImageFrame.origin.x
            inset.top = rightImageFrame.origin.y
            inset.right = rightActionButton.bounds.width - (rightImageFrame.origin.x + rightImageFrame.width)
            inset.bottom = rightActionButton.bounds.height - (rightImageFrame.origin.y + rightImageFrame.height)
            
//            rightActionButton.imageEdgeInsets = inset
            
            rightActionButton.setTitle(nil, for: .normal)
            rightActionButton.titleEdgeInsets = UIEdgeInsets.zero
            
            return
        } else {
            rightActionButton.setImage(nil, for: .normal)
            rightActionButton.imageEdgeInsets = UIEdgeInsets.zero
        }
        
        if let title = rightTitle {
            rightActionButton.setTitle(rightTitle, for: .normal)
            
            var inset = UIEdgeInsets()
            inset.left = rightTitleFrame.origin.x
            inset.top = rightTitleFrame.origin.y
            inset.right = rightActionButton.bounds.width - (rightTitleFrame.origin.x + rightTitleFrame.width)
            inset.bottom = rightActionButton.bounds.height - (rightTitleFrame.origin.y + rightTitleFrame.height)
            
            rightActionButton.titleEdgeInsets = inset
            
            rightActionButton.setTitleColor(rightTitleColor ?? rightActionButton.tintColor, for: .normal)
            
            rightActionButton.setImage(nil, for: .normal)
            rightActionButton.imageEdgeInsets = UIEdgeInsets.zero
        } else {
            rightActionButton.setTitle(nil, for: .normal)
            rightActionButton.titleEdgeInsets = UIEdgeInsets.zero
        }
    }
    
    
    
    open func setupRightContainer() {
        guard setupHandler?(.right, rightContainerView).contains(.right) != .some(true) else {
            return
        }
        
        let views = ["rbtn": rightActionButton]
        
        rightContainerView.addSubview(rightActionButton)
        
        let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[rbtn]|", options: [], metrics: nil, views: views)
        rightContainerView.addConstraints(horzConstraints)
        
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[rbtn]|", options: [], metrics: nil, views: views)
        rightContainerView.addConstraints(vertConstraints)
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: -
    
    public var tapHandler: HeaderTapHandler?
    public var setupHandler: CustomHeaderSetupHandler?
    
    override func setup() {
        super.setup()
        
        setupLeftContainer()
        setupCenterContainer()
        setupRightContainer()
        
        bringSubview(toFront: bottomLineView)
    }
    
    open override func prepareForInterfaceBuilder() {
        setup()
    }
    
    open override func awakeFromNib() {
        setup()
    }
}
