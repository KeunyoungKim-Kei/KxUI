//
//  ColorListTableViewController.swift
//  KxUI
//
//  Created by Keun young Kim on 2016. 12. 21..
//  Copyright © 2016년 CocoaPods. All rights reserved.
//

import UIKit

class ColorListTableViewController: UIViewController/*, UITableViewDataSource, UITableViewDelegate*/ {
    
    @IBOutlet weak var colorListView: UITableView!
    
//    lazy var ds: ColorDataSource = { [weak self] in
//        return ColorDataSource(tableView: self?.colorListView)
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        ds.isAppleColor = false
//        //ds.fetchMoreEnabled = false
//        ds.fetch(type: .refresh)
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return ds.sectionCount
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    
//        return ds.cellCount
//    }
//    
    func tableView(_ tbl: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ColorListTableViewCell.dequeueComposedCell(from: tbl, data: nil)
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let data = ds[indexPath]        
//        navigationController?.navigationBar.barTintColor = data?.color
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ds.titleFor(section: section)
//    }
}
