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

import CoreTelephony

public struct KUDevice {
    public static var mainScreenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    
    
    public static var mainScreenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    
    
    public static var mainScreenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    
    
    public static func canPhoneCall() -> Bool {
        var canCall = false
        let url = URL(string: "tel://")
        if UIApplication.shared.canOpenURL(url!) {
            let info = CTTelephonyNetworkInfo()
            guard let carrier = info.subscriberCellularProvider else {
                return canCall
            }
            
            let mnc = carrier.mobileNetworkCode
         
         #if swift(>=3.2)
            if let mnc = mnc, mnc.count > 0 {
               canCall = true
            }
         #else
            if let mnc = mnc, mnc.characters.count > 0 {
               canCall = true
            }
         #endif
         
        }
        
        return canCall
    }
}
