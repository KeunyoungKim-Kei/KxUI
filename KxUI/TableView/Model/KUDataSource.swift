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

public typealias KUDataFetchCompletion = () -> ()

public enum DataFetchType {
    case refresh
    case incremental
}

public typealias ApiDictionary = [String: Any]
public typealias ApiDictionaryList = [ApiDictionary]

public protocol ApiDictionaryParsable {
    init?(dict: ApiDictionary)
}

public protocol DataSourceCompatible {
    associatedtype DataType
    var count: Int { get }
    var cellCount: Int { get }
    subscript(at: IndexPath) -> DataType? { get }
    subscript(index: Int) -> DataType? { get }
    func fetch(type: DataFetchType, completion: KUDataFetchCompletion?)
}

public protocol TableViewDataSourceCompatible: DataSourceCompatible {
    init(tableView: UITableView?)
}

public extension Array {
    func validateBound(with index: Int) -> Bool {
        return index >= 0 && index < self.count
    }
}

public struct KUSectionData<T> {
    public let title: String?
    public var itemList = [T]()
    public var count: Int {
        return itemList.count
    }
    
    public func validateBound(with index: Int) -> Bool {
        return itemList.validateBound(with: index)
    }
    
    public subscript(_ index: Int) -> T? {
        if itemList.validateBound(with: index) {
            return itemList[index]
        }
        
        return nil
    }
}

open class KUDataSource<T: ApiDictionaryParsable>: DataSourceCompatible {
    /// 데이터 요청 큐
    public let fetchQueue = DispatchQueue.global(qos: .userInitiated)
    
    /// 데이터 요청 형식
    open var fetchType = DataFetchType.refresh
    
//    /// 연관 테이블 뷰
//    open var tableView: UITableView?    
    
    /// 데이터 배열
    open var list = [T]()
    
    /// 필터링된 데이터 배열
    open var filteredList = [T]()
    
    /// 요청 페이지
    open var fetchPage = 1
    
    /// 요청 데이터 수
    open var pageSize: Int {
        return 10
    }
    
    /// 추가 데이터 존재 플래그
    open var hasMore = true
    
    /// 가져오기 상태 플래그
    open var fetching = false
    
    /// 요청 전 데이터 수
    open var countBeforeFetch = 0
    
    /// 검색 키워드
    open var searchKeyword: String?
    
    /// 처리 대상 섹션
    open var targetSection = 0
    
    /// 검색 상태 플래그
    open var searching: Bool {
        return searchKeyword != nil
    }
    
    open var updateMinimulInterval = 1.0
    
    /// 무효화 플래그. 실행중인 데이터 요청을 중지하기 위해 사용
    open var invalidated = false
    
    /// 처리 대상 배열. 검색시 필터링된 데이터 배열 리턴
    open var targetList: [T] {
        if searching {
            return filteredList
        }
        
        return list
    }
    
    /// 실제 데이터 수
    open var count: Int {
        return targetList.count
    }
    
    /// 테이블에 표시할 셀 수
    open var cellCount: Int {
        if targetList.count > 0 {
            return targetList.count + 1
        } else if !hasMore {
            return targetList.count + 1
        }
        
        return targetList.count
    }
    
    /// 테이블에 표시할 섹션 수
    open var sectionCount: Int {
        return 1
    }
    
    /// 지징된 위치에 있는 데이터 리턴
    ///
    /// - Parameter at: 인덱스패스. row 값만 사용함
    open subscript(at: IndexPath) -> T? {
        guard at.row < targetList.count else {
            return nil
        }
        
        return targetList[at.row]
    }
    
    
    /// 지정된 인덱스에 있는 데이터 리턴
    ///
    /// - Parameter index: 인덱스
    open subscript(index: Int) -> T? {
        guard index < targetList.count else {
            return nil
        }
        
        return targetList[index]
    }
    
    /**
     To initialize a new object (the receiver) immediately after memory for it has been allocated.
     
     - Returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    init() {
        
    }
    
//    /**
//     새로운 데이터 소스를 초기화 합니다.
//     
//     - Parameter tableView: 연관된 테이블뷰
//     */
//    public init(tableView: UITableView? = nil) {
//        self.tableView = tableView
//        
//        if let tahbleView = tableView as? KUDynamicTableView {
//            tahbleView.refreshHandler = { [weak self] tbl in
//                self?.fetch(type: .refresh)
//            }
//        }
//    }
    
    /**
     데이터를 초기화 합니다.
     */
    open func reset() {
        list = []
    }
    
    /**
     데이터 요청이 가능한지 확인 후 준비 작업을 실행합니다.
     
     - Returns: 데이터 요청이 가능한 경우 true, 그 외의 경우 false
     */
    private func shouldStartFetching() -> Bool {
        if fetchType == .refresh {
            hasMore = true
        }
        
        if fetching || !hasMore {
            return false
        }
        
        fetching = true
        
        if fetchType == .refresh {
            reset()
        }
        
        countBeforeFetch = list.count
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        return true
    }
    
    /**
     데이터 요청 후 마무리 작업을 실행합니다.
     */
    func finishFetching() {
        fetching = false
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
//        if let tbl = tableView as? KUDynamicTableView {
//            tbl.endRefreshing()
//        }
    }
    
    /**
     데이터를 요청합니다.
     
     - Parameter type: 데이터 요청 형식
     - Parameter completion: 완료 블록
     */
    open func fetch(type: DataFetchType = .refresh, completion: KUDataFetchCompletion? = nil) {
        defer {
            finishFetching()
        }
        
        fetchType = type
        
        guard shouldStartFetching() else { return }
        
        switch fetchType {
        case .refresh:
            fetchPage = 1
        case .incremental:
            fetchPage += 1
        }
        
        fetchQueue.async { [weak self] in
            self?.composeList(completion: completion)
        }
    }
    
    /**
     데이터 요청 후 전달받은 응답 데이터를 통해 목록을 구성합니다.
     
     - Parameter completion: 완료 블록
     */
    open func composeList(completion: KUDataFetchCompletion? = nil) {
//        guard !invalidated else {
//            invalidated = false
//            return
//        }
//        
//        switch fetchType {
//        case .refresh:
//            DispatchQueue.main.async { [weak self] in
//                self?.tableView?.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
//                self?.tableView?.reloadData()
//                completion?()
//            }
//        case .incremental:
//            DispatchQueue.main.asyncAfter(deadline: .now() + updateMinimulInterval) { [weak self] in
//                if let strongSelf = self {
//                    var indexPaths = [IndexPath]()
//                    for index in strongSelf.countBeforeFetch..<strongSelf.list.count {
//                        indexPaths.append(IndexPath(row: index, section: strongSelf.targetSection))
//                    }
//                    
//                    if indexPaths.count > 0 {
//                        strongSelf.tableView?.insertRows(at: indexPaths, with: .automatic)
//                    }
//                    
//                    let lastIndexPath = IndexPath(row: strongSelf.list.count, section: strongSelf.targetSection)
//                    strongSelf.tableView?.reloadRows(at: [lastIndexPath], with: .automatic)
//                }
//                
//                completion?()
//            }
//        }
    }
    
    open var totalDataCount = 0
    
    open func updateAdditionalDataStatus(from list: ApiDictionaryList, totalCnt: Int) {
        totalDataCount = totalCnt
        hasMore = !(list.count == 0 || self.list.count + list.count >= totalCnt)
    }
    
    open func fillArray(from list: ApiDictionaryList, totalCnt: Int) {
        updateAdditionalDataStatus(from: list, totalCnt: totalCnt)
        
        for item in list {
            guard let data = T(dict: item) else {
                continue
            }
            
            self.list.append(data)
        }
    }
}
