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

class KUCommonNavigationController: UINavigationController {

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topVC = topViewController as? KUCommonViewController {
            if let color = topVC.headerView?.backgroundColor {
                return color.isDark ? .lightContent : .default
            }
        }
        
        return .lightContent
    }
    

   #if swift(>=4.2)
   override var childForStatusBarStyle: UIViewController? {
      return viewControllers.last
   }
   
   override var childForStatusBarHidden: UIViewController? {
      return viewControllers.last
   }
   #else
   override var childViewControllerForStatusBarStyle: UIViewController? {
      return viewControllers.last
   }
   
   override var childViewControllerForStatusBarHidden: UIViewController? {
      return viewControllers.last
   }
   #endif
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        extendedLayoutIncludesOpaqueBars = true
    }
}
