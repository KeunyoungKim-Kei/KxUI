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

public typealias KUAlertReponseHandler = () -> ()

public extension UIViewController {
    /**
     확인 버튼이 포함된 경고창을 표시합니다.
     
     - Parameter message: 경고 메시지
     */
    public func showInfoAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: NSLocalizedString("확인", comment: "확인"), style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    /**
     확인 버튼과 취소 버튼이 포함된 경고창을 표시합니다.
     
     사용자의 긍정/부정 응답을 처리하기 위해 사용합니다.
     
     - Parameter message: 경고 메시지
     - Parameter positiveButtonTitle: 긍정 버튼 제목
     - Parameter positiveHandler: 긍정 응답 처리 클로저
     - Parameter negativeHandler: 부정 응답 처리 클로저
     */
    public func showConfirmAlert(message: String, positiveButtonTitle: String = NSLocalizedString("확인", comment: "확인"), positiveHandler: KUAlertReponseHandler?, negativeHandler: KUAlertReponseHandler?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: positiveButtonTitle, style: .default, handler: { alert in
            positiveHandler?()
        })
        alert.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("취소", comment: "취소"), style: .cancel, handler: { alert in
            negativeHandler?()
        })
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
