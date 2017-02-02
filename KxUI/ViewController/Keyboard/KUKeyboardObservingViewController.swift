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

open class KUKeyboardObservingViewController: KUCommonViewController {
    
    /// 키보드 이벤트 감시 활성화 플래그
    var observingEnabled = true
    
    var resignFirstResponderWhenDismiss = true
    
    /// 내용 스크롤뷰
    @IBOutlet open weak var contentScrollView: UIScrollView?
    
    
    open var keyboardFrame: CGRect = CGRect.zero
    open var keyboardAnimationDuration: CGFloat = 0.3
    
    open lazy var keyboardHideTapGesture: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: #selector(KUKeyboardObservingViewController.handleTapGuesture(_:)))
    }()
    
    open var inputTargetView: UIView?
    
    
    open func onKeyboardWillShow() {
        
    }
    
    open func onKeyboardWillHide() {
        
    }
    
    
    open func attachTapGesture(_ view: UIView) {
        view.addGestureRecognizer(keyboardHideTapGesture)
    }
    
    
    /////////////////////////////////////////////////////////////////////
    //
    // MARK: - Tap Gesture
    //
    func handleTapGuesture(_ tap: UITapGestureRecognizer) {
        findFirstResponderAndResign()
    }
    
    
    
    
    /////////////////////////////////////////////////////////////////////
    //
    // MARK: - Notification
    //
    open override func handle(notification: Notification) {
        super.handle(notification: notification)
        
        switch notification.name {
        case NSNotification.Name.UIKeyboardWillShow:
            if let info = notification.userInfo {
                keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
                keyboardAnimationDuration = CGFloat((info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue)
                
                DispatchQueue.main.async(execute: { [weak self] () -> Void in
                    self?.onKeyboardWillShow()
                })
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(keyboardAnimationDuration * CGFloat(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: { [weak self] () -> Void in
                    self?.inputTargetView = self?.findFirstResponder()
                })
            }
            
            if let scrollView = contentScrollView {
                var insets = scrollView.contentInset
                insets.bottom = keyboardFrame.height
                scrollView.contentInset = insets
                
                insets = scrollView.scrollIndicatorInsets
                insets.bottom = keyboardFrame.height
                scrollView.scrollIndicatorInsets = insets
            }
        case NSNotification.Name.UIKeyboardWillHide:
            inputTargetView = nil
            
            DispatchQueue.main.async(execute: { [weak self] () -> Void in
                self?.onKeyboardWillHide()
            })
            
            if let scrollView = contentScrollView {
                var insets = scrollView.contentInset
                insets.bottom = 0
                scrollView.contentInset = insets
                
                insets = scrollView.scrollIndicatorInsets
                insets.bottom = 0
                scrollView.scrollIndicatorInsets = insets
            }
        default:
            break
        }
    }
    
    
    
    
    /////////////////////////////////////////////////////////////////////
    //
    // MARK: - VC Life Cycle
    //
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if observingEnabled {
            register(names: [NSNotification.Name.UIKeyboardWillShow, NSNotification.Name.UIKeyboardWillHide])
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if resignFirstResponderWhenDismiss {
            findFirstResponderAndResign()
        }
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        deregister(name: NSNotification.Name.UIKeyboardWillShow)
        deregister(name: NSNotification.Name.UIKeyboardWillHide)
    }
}
