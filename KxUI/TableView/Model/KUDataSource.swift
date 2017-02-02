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

public protocol KUDataContainer {
    associatedtype ItemType
    
    var count: Int { get }
    
    subscript(at: IndexPath) -> ItemType? { get }
    
    mutating func append(_ item: ItemType)
    mutating func append(items: [ItemType])
    mutating func fetch(type: DataFetchType, completion: KUDataFetchCompletion?)
}

public extension Array {
    public func validateBound(with index: Int) -> Bool {
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

open class KUDataSource<T> {
    let fetchQueue = DispatchQueue.global(qos: .userInitiated)
    
    open var fetchType = DataFetchType.refresh
    
    open var tableView: UITableView?
    
    open var itemList = [KUSectionData<T>]()
    open var filteredList = [KUSectionData<T>]()
    
    open var showsNetworkIndicator = false
    open var fetchMoreEnabled = true
    open var fetchSize = 20
    open var hasMore = true
    open var fetching = false
    
    open var counterBeforeFetch: [(section: Int, row: Int)] = []
    
    open var searchKeyword: String?
    
    
    open var searching: Bool {
        return searchKeyword != nil
    }
    
    open var targetList: [KUSectionData<T>] {
        if searching {
            return filteredList
        }
        
        return itemList
    }
    
    open func itemCount(at section: Int) -> Int {
        if targetList.validateBound(with: section) {
            return targetList[section].count
        }
        
        return 0
    }
    
    
    open func rowCount(at section: Int) -> Int {
        if fetchMoreEnabled && section == sectionCount() - 1 && itemCount(at: section) > 0 {
            return targetList[section].count + 1
        }
        
        return targetList[section].count
    }
    
    open func sectionCount() -> Int {
        return targetList.count
    }
    
    
    open subscript(_ indexPath: IndexPath) -> T? {
        guard targetList.validateBound(with: indexPath.section) else {
            return nil
        }
        
        guard targetList[indexPath.section].validateBound(with: indexPath.row) else {
            return nil
        }
        
        return targetList[indexPath.section][indexPath.row]
    }
    
    open func titleFor(section: Int) -> String? {
        guard targetList.validateBound(with: section) else { return nil }
        
        return targetList[section].title
    }
    
    public init(tableView: UITableView? = nil) {
        self.tableView = tableView
        
        if let tahbleView = tableView as? KUDynamicTableView {
            tahbleView.refreshHandler = { [weak self] tbl in
                self?.fetch(type: .refresh)
            }
        }
    }
    
    open func append(_ item: T, at section: Int = 0, title: String? = nil) {
        append(items: [item], at: section, title: title)
    }
    
    open func append(items: [T], at section: Int = 0, title: String? = nil) {
        if searching {
            if !filteredList.validateBound(with: section) {
                let newSection = KUSectionData(title: title, itemList: items)
                filteredList.append(newSection)
            } else {
                filteredList[section].itemList.append(contentsOf: items)
            }
        } else {
            if !itemList.validateBound(with: section) {
                let newSection = KUSectionData(title: title, itemList: items)
                itemList.append(newSection)
            } else {
                itemList[section].itemList.append(contentsOf: items)
            }
        }
    }
    
    private func shouldStartFetching(fetchOffset: Int) -> Bool {
        if fetchOffset == 0 {
            hasMore = true
        }
        
        if fetching || !hasMore {
            return false
        }
        
        fetching = true
        
        if fetchOffset == 0 {
            fetchType = .refresh
            if searching {
                filteredList.removeAll()
            } else {
                itemList.removeAll()
            }
        } else {
            fetchType = .incremental
        }
        
        print("start fetching.. \(fetchOffset)")
        
        for section in 0..<targetList.count {
            let rowCount = targetList[section].count
            
            counterBeforeFetch.append((section: section, row: rowCount))
        }
        
        if showsNetworkIndicator {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        return true
    }
    
    private func finishFetching() {
        fetching = false
        
        if showsNetworkIndicator {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        if let tbl = tableView as? KUDynamicTableView {
            tbl.endRefreshing()
        }
    }
    
    
    open func fetch(type: DataFetchType = .refresh, completion: KUDataFetchCompletion? = nil) {
        defer {
            finishFetching()
        }
        
        let offset = type == .incremental ? targetList.count : 0
        
        guard shouldStartFetching(fetchOffset: offset) else { return }
        
        fetchQueue.async { [weak self] in
            self?.composeList(completion: completion)
        }
    }
    
    open func composeList(completion: KUDataFetchCompletion? = nil) {
        DispatchQueue.main.async { [weak self] in
            if let strongSelf = self {
                switch strongSelf.fetchType {
                case .refresh:
                    print("done refresh")
                    strongSelf.tableView?.reloadData()
                case .incremental:
                    print("done incremental")
                    
                    strongSelf.tableView?.reloadData()
                }
            }
            
            completion?()
        }
    }
    
    
    open func composeList() {
        fatalError("Override this!")
    }
}




let DummyTitle = "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
let DummyContent = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
