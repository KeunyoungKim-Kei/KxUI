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
public typealias AlertInputCompletion = (String?)->()

public extension UIViewController {
    /**
     확인 버튼이 포함된 경고창을 표시합니다.
     
     - Parameter message: 경고 메시지
     */
    open func showInfoAlert(title: String? = nil, message: String, confirmTitle: String = NSLocalizedString("확인", comment: "확인")) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: confirmTitle, style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(action)
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func showPasswordAlert(positiveHandler: AlertInputCompletion?, negativeHandler: AlertInputCompletion?) {
        DispatchQueue.main.async { [weak self] in
            let title = NSLocalizedString("비밀번호 확인", comment: "비밀번호 확인")
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: { (textField) in
                textField.placeholder = NSLocalizedString("비밀번호를 입력해 주세요.", comment: "비밀번호를 입력해 주세요.")
            })
            
            let confirmAction = UIAlertAction(title: NSLocalizedString("확인", comment: "확인"), style: .default, handler: { action in
                if let inputField = alert.textFields?.first {
                    positiveHandler?(inputField.text)
                }
            })
            alert.addAction(confirmAction)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("취소", comment: "취소"), style: .cancel, handler: { action in
                negativeHandler?(nil)
            })
            alert.addAction(cancelAction)
            
            self?.present(alert, animated: true, completion: nil)
        }
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
