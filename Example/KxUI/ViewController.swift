//
//  ViewController.swift
//  KxUI
//
//  Created by Keun young Kim on 12/19/2016.
//  Copyright (c) 2016 Keun young Kim. All rights reserved.
//

import UIKit
import KxUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.backgroundColor = UIColor.Apple.tealBlue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func asdfdsaf(_ sender: UIButton) {
        let popup = KUAnchoredPopupView()        
        popup.text = "2017.01.30 까지"
        popup.label.font = UIFont.systemFont(ofSize: 10)
        popup.popupColor = UIColor.MaterialBlue.primary
        
        popup.show(in: view, anchor: sender, centerOffset: 20, topMargin: 10)
    }
    
    @IBAction func show(_ sender: UIButton) {
        let popup = KUAnchoredPopupView()
        popup.text = "asdfaDF"
        popup.show(in: view, anchor: sender)
    }

}

