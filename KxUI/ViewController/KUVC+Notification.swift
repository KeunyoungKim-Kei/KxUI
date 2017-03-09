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


public extension KUCommonViewController {
    public func post(rawNotificationName name: String, object: Any? = nil) {
        post(name: Notification.Name(rawValue: name), object: object)
    }
    
    public func post(name: Notification.Name, object: Any? = nil) {
        NotificationCenter.default.post(name: name, object: object)
    }
    
    
    
    public func register(rawNotificationName name: String) {
        register(name: NSNotification.Name(rawValue: name))
    }
    
    
    public func register(name: Notification.Name) {
        NotificationCenter.default.addObserver(self, selector: #selector(handle(notification:)), name: name, object: nil)
        notificationNames.append(name)
    }
    
    
    
    
    public func register(rawNotificationNames names: [String]) {
        for name in names {
            register(rawNotificationName: name)
        }
    }
    
    public func register(names: [NSNotification.Name]) {
        for name in names {
            register(name: name)
        }
    }
    
    
    
    public func deregister(rawNotificationName name: String) {
        deregister(name: NSNotification.Name(rawValue: name))
    }
    
    public func deregister(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
        
        if let index = notificationNames.index(of: name) {
            notificationNames.remove(at: index)
        }
    }
    
    
    
    public func deregister(rawNotificationNames names: [String]) {
        for name in names {
            deregister(rawNotificationName: name)
        }
    }
    
    public func deregister(names: [NSNotification.Name]) {
        for name in names {
            deregister(name: name)
        }
    }
    
    
    
    public func deregisterAllNotifications() {
        notificationNames.removeAll()
        NotificationCenter.default.removeObserver(self)
    }
}
