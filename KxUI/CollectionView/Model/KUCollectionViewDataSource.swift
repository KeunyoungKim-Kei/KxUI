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

open class KUCollectionViewDataSource<T: ApiDictionaryParsable>: KUDataSource<T> {
    
    open var collectionView: UICollectionView?
    
    
    
    public init(collectionView: UICollectionView?) {
        super.init()
        
        self.collectionView = collectionView
        
        
    }
    
    
    
    /**
     데이터 요청 후 마무리 작업을 실행합니다.
     */
    internal override func finishFetching() {
        super.finishFetching()
        
        
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
                self?.collectionView?.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
                self?.collectionView?.reloadData()
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
                        strongSelf.collectionView?.insertItems(at: indexPaths)
                    }
                    
                    let lastIndexPath = IndexPath(row: strongSelf.list.count, section: strongSelf.targetSection)
                    strongSelf.collectionView?.reloadItems(at: [lastIndexPath])
                }
                
                completion?()
            }
        }
    }
}
