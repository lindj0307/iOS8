//
//  HappinessViewController.swift
//  Happiness
//
//  Created by 林东杰 on 15/7/14.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController ,FaceViewDataSource {
    
//    @IBAction func changeHappniess(sender: UISlider) {
//        happniess = Int(sender.value)
//    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
  
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended:fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happniess += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:break
        }
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            //添加手势识别,这个是识别放大与缩小之类的手势   scale是FaceView里面的一个方法
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
//            faceView.addGestureRecognizer(UIPanGestureRecognizer(target: faceView, action: "changeHappiness:"))
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
        faceView?.setNeedsDisplay()
        title = String(self.happniess)
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
