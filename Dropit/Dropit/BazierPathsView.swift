//
//  BazierPathsView.swift
//  Dropit
//
//  Created by 林东杰 on 8/23/15.
//  Copyright (c) 2015 anta. All rights reserved.
//

import UIKit

class BazierPathsView: UIView {
    
    private var bezierPaths = [String: UIBezierPath]()
    
    func setPath(path: UIBezierPath?, named name: String) {
        bezierPaths[name] = path
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for (_,path) in bezierPaths {
            path.stroke()
        }
    }
}
