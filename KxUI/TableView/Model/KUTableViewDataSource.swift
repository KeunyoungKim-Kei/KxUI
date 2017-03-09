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



open class KUTableViewDataSource<T: ApiDictionaryParsable>: KUDataSource<T> {
    /// 연관 테이블 뷰
    open var tableView: UITableView?
    
        
    /**
     새로운 데이터 소스를 초기화 합니다.
     
     - Parameter tableView: 연관된 테이블뷰
     */
    public init(tableView: UITableView?) {
        super.init()
        
        self.tableView = tableView
        
        if let tahbleView = tableView as? KUDynamicTableView {
            tahbleView.refreshHandler = { [weak self] tbl in
                self?.fetch(type: .refresh)
            }
        }
    }
    
    
    
    /**
     데이터 요청 후 마무리 작업을 실행합니다.
     */
    internal override func finishFetching() {
        super.finishFetching()
        
        if let tbl = tableView as? KUDynamicTableView {
            tbl.endRefreshing()
        }
    }
    
    
    /**
     데이터 요청 후 전달받은 응답 데이터를 통해 목록을 구성합니다.
     
     - Parameter completion: 완료 블록
     */
    open override func composeList(completion: KUDataFetchCompletion? = nil) {
        guard !invalidated else {
            invalidated = false
            return
        }
        
        switch fetchType {
        case .refresh:
            DispatchQueue.main.async { [weak self] in
                self?.tableView?.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
                self?.tableView?.reloadData()
                completion?()
            }
        case .incremental:
            DispatchQueue.main.asyncAfter(deadline: .now() + updateMinimulInterval) { [weak self] in
                if let strongSelf = self {
                    var indexPaths = [IndexPath]()
                    for index in strongSelf.countBeforeFetch..<strongSelf.list.count {
                        indexPaths.append(IndexPath(row: index, section: strongSelf.targetSection))
                    }
                    
                    if indexPaths.count > 0 {
                        strongSelf.tableView?.insertRows(at: indexPaths, with: .automatic)
                    }
                    
                    let lastIndexPath = IndexPath(row: strongSelf.list.count, section: strongSelf.targetSection)
                    strongSelf.tableView?.reloadRows(at: [lastIndexPath], with: .automatic)
                }
                
                completion?()
            }
        }
    }
}
