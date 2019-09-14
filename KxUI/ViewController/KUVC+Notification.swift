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
   func post(rawNotificationName name: String, object: Any? = nil) {
      post(name: Notification.Name(rawValue: name), object: object)
   }
   
   func post(name: Notification.Name, object: Any? = nil) {
      NotificationCenter.default.post(name: name, object: object)
   }
   
   
   
   func register(rawNotificationName name: String) {
      register(name: NSNotification.Name(rawValue: name))
   }
   
   
   func register(name: Notification.Name) {
      NotificationCenter.default.addObserver(self, selector: #selector(handle(notification:)), name: name, object: nil)
      notificationNames.append(name)
   }
   
   
   
   
   func register(rawNotificationNames names: [String]) {
      for name in names {
         register(rawNotificationName: name)
      }
   }
   
   func register(names: [NSNotification.Name]) {
      for name in names {
         register(name: name)
      }
   }
   
   
   
   func deregister(rawNotificationName name: String) {
      deregister(name: NSNotification.Name(rawValue: name))
   }
   
   func deregister(name: Notification.Name) {
      NotificationCenter.default.removeObserver(self, name: name, object: nil)
      
      if let index = notificationNames.firstIndex(of: name) {
         notificationNames.remove(at: index)
      }
   }
   
   
   
   func deregister(rawNotificationNames names: [String]) {
      for name in names {
         deregister(rawNotificationName: name)
      }
   }
   
   func deregister(names: [NSNotification.Name]) {
      for name in names {
         deregister(name: name)
      }
   }
   
   
   
   func deregisterAllNotifications() {
      if #available(iOS 9.0, *) {
         
      } else {
         notificationNames.removeAll()
         NotificationCenter.default.removeObserver(self)
      }
   }
}
