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

import Foundation

public var LogViewControllerDeinitialization = true

open class KUCommonViewController: UIViewController {
    
    open var standalone = false
    
    open var visibleToUser = true
    open var notificationNames: [NSNotification.Name] = []
    open var backgroundImage: UIImage?
    
    @IBOutlet public weak var headerView: KUHeaderView!
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let parentVC = parent {
            return parentVC.preferredStatusBarStyle
        }
        
        if let color = headerView?.backgroundColor {
            return color.isDark ? .lightContent : .default
        }
        
        return .lightContent
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Timer 
    var timer: DispatchSourceTimer?
    
    open var timerEnabled: Bool {
        return false
    }
    
    open var timerInterval: DispatchTimeInterval {
        return .seconds(3)
    }
    
    /**
     
     */
    func setupTimer(on queue: DispatchQueue = DispatchQueue.main) {
        timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
        timer?.scheduleRepeating(deadline: .now(), interval: timerInterval)
        timer?.setEventHandler { [weak self] in
            print("=====================================")
            self?.performTimerTask()
        }
    }
    
    open dynamic func performTimerTask() {
        print("111")
    }
    
    /**
     
     */
    open func startTimer() {
        setupTimer()
        timer?.resume()
    }
    
    /**
     
     */
    open func stopTimer() {
        timer?.cancel()
        timer = nil
    }
    
    /////////////////////////////////////////////////////////////////////
    //
    // MARK: - Notification
    //
    
    open func handle(notification: Notification) {
        //print("HANDLE NOTIFICATION")
    }
    
    
    
    /////////////////////////////////////////////////////////////////////
    //
    // MARK: - VC Life Cycle
    //
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        visibleToUser = true
        
        UIApplication.shared.setStatusBarStyle(preferredStatusBarStyle, animated: true)
        setNeedsStatusBarAppearanceUpdate()        
        
        register(names: [.KUHeaderLeftButtonTap, .KUHeaderCenterButtonTap, .KUHeaderRightButtonTap])
        
        if timerEnabled {
            print("===================== START TIMER")
            startTimer()
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        stopTimer()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        visibleToUser = false
        
        deregister(names: [.KUHeaderLeftButtonTap, .KUHeaderCenterButtonTap, .KUHeaderRightButtonTap])
    }
    
    
    
    deinit {
        deregisterAllNotifications()
        
        if LogViewControllerDeinitialization {
            print("deinit: \(classForCoder)")
        }
    }
}
