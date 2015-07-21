//
//  HappinessViewController.swift
//  Happiness
//
//  Created by 林东杰 on 15/7/14.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController ,FaceViewDataSource {
    
    @IBAction func changeHappniess(sender: UISlider) {
        happniess = Int(sender.value)
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
        }
    }
    
    //this is model
    var happniess: Int = 100 {
        didSet{
            happniess = min(max(happniess, 0),100)
            updateUI()
        }
    }
    
    private func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func siminessForFaceView(sender: FaceView) -> Double? {
        return Double(happniess-50)/50
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
