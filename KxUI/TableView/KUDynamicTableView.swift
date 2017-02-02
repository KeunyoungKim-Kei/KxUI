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

open class KUDynamicTableView: UITableView {
    
    open var tableRefreshControl: UIRefreshControl?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
//        let fetchMoreNib = UINib(nibName: "FetchMoreTableViewCell", bundle: nil)
//        register(fetchMoreNib, forCellReuseIdentifier: FetchMoreTableViewCell.cellIdentifier)
//        
//        let noMoreDataNib = UINib(nibName: "NoMoreDataTableViewCell", bundle: nil)
//        register(noMoreDataNib, forCellReuseIdentifier: NoMoreDataTableViewCell.cellIdentifier)
        
        if #available(iOS 10.0, *) {
            refreshControl = UIRefreshControl()
            //refreshControl?.tintColor = UIColor.fiBrightBlue
            refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
            
            tableRefreshControl = refreshControl
        } else {
            let control = UIRefreshControl()
            //control.tintColor = UIColor.fiBrightBlue
            control.addTarget(self, action: #selector(refresh), for: .valueChanged)
            
            addSubview(control)
            
            tableRefreshControl = control
        }
    }
    
    open func endRefreshing() {
        //        DispatchQueue.main.async { [weak self] in
        //            self?.tableRefreshControl?.endRefreshing()
        //        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.tableRefreshControl?.endRefreshing()
            
        }
    }
    
    open func refresh() {
        print("refresh")
        refreshHandler?(self)
    }
    
    open var refreshHandler: ((_ tableView: KUDynamicTableView) -> ())?
    
    
}
