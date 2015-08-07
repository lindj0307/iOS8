//
//  ViewController.swift
//  AutoLayout
//
//  Created by 林东杰 on 15/8/7.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure: Bool = false {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
//        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "SecurePassword" : "Password"
    }
    
    @IBAction func toggleSecruity(sender: AnyObject) {
        secure = !secure
    }
    
    
    
}



















