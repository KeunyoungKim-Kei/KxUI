//
//  ColorListTableViewCell.swift
//  KxUI
//
//  Created by Keun young Kim on 2016. 12. 21..
//  Copyright © 2016년 CocoaPods. All rights reserved.
//

import UIKit
import KxUI

final class ColorListTableViewCell: KUTableViewCell<ColorItem> {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rgbLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!

    override func compose(with data: ColorItem?) {
        if let data = data {
            colorView.backgroundColor = data.color
            nameLabel.text            = data.name
            
            let nsstr = NSString(string: data.rgb)
            let rgbAttrStr = NSMutableAttributedString(string: data.rgb)
            rgbAttrStr.addAttributes([NSForegroundColorAttributeName: UIColor.Apple.red], range: nsstr.range(of: "R"))
            rgbAttrStr.addAttributes([NSForegroundColorAttributeName: UIColor.Apple.green], range: nsstr.range(of: "G"))
            rgbAttrStr.addAttributes([NSForegroundColorAttributeName: UIColor.Apple.blue], range: nsstr.range(of: "B"))
            
            rgbLabel.attributedText = rgbAttrStr
            
            hexLabel.text             = data.hex
        }
    }

    override class func dequeueComposedCell(from tableView: UITableView, data: ColorItem?) -> ColorListTableViewCell? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ColorListTableViewCell {
            cell.compose(with: data)
            return cell
        }
        
        return nil
    }
}
