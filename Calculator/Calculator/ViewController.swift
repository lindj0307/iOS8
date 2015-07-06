//
//  ViewController.swift
//  Calculator
//
//  Created by 林东杰 on 15/6/9.
//  Copyright (c) 2015年 Joey. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var lbDisplay: UILabel!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    var brain = CalculatorBrain()
    

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            lbDisplay.text = lbDisplay.text!+digit
        }else {
            lbDisplay.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
//    var operandStack: Array<Double> = Array<Double>()
    //var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            //Home work
            displayValue = 0
        }
//        operandStack.append(displayValue)
//        println("operandStack = \(operandStack)")
        
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(lbDisplay.text!)!.doubleValue
        }
        set{
            lbDisplay.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
//        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
//        switch operation {
//        case "×" : preformOperation {$0 * $1}
//        case "÷" : preformOperation {$0 / $1}
//        case "+" : preformOperation {$0 + $1}
//        case "−" : preformOperation {$0 - $1}
//        case "√" : preformOperation { sqrt($0)}
//        default : break
//        }
    }
//    
//    func preformOperation(operation : (Double,Double) -> Double) {
//        if operandStack.count>=2 {
//            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
//            enter()
//        }
//    }
//    
//    private func preformOperation(operation : Double -> Double) {
//        if operandStack.count>=1 {
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

