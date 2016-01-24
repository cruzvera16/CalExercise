//
//  ViewController.swift
//  retro-cal-exercise
//
//  Created by Cruz Martin Vera on 1/18/16.
//  Copyright © 2016 Cruz Martin Vera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UILabel!
    
    // just to cooment to see how git changes
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        case Equal = "="
        case Perrcentaje = "%"
        case Clear = "C"
        case AllClear = "AC"
    }
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var currentSign = ""
    var result = ""
    var dotPresent = false
    
    
    @IBAction func numberPressed(btn: UIButton!) {
        runningNumber += "\(btn.tag)"
        outputDisplay.text = runningNumber
    }
    
    @IBAction func dotPressed(dot: UIButton) {
        if dotPresent == false {
            runningNumber += "."
            outputDisplay.text = runningNumber
            dotPresent = true
        }
        
    }
    
    @IBAction func signPressed(sign: UIButton) {
        runningNumber = outputDisplay.text!
        runningNumber = "\(-Double(runningNumber)!)"
        outputDisplay.text = runningNumber
        
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    

    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(Operation.Equal)
    }
    
    @IBAction func onPercentajePressed(sender: AnyObject) {
        runningNumber = "\(Double(runningNumber)! / 100)"
        outputDisplay.text = runningNumber
    }
    
    @IBAction func onClearPressed(sender: AnyObject) {
        runningNumber = ""
        outputDisplay.text = runningNumber
    }
    
    @IBAction func onAllClearPressed(sender: AnyObject) {
        runningNumber = ""
        outputDisplay.text = runningNumber
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        currentSign = ""
        dotPresent = false
    }
    
    func processOperation(op: Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                
                rightValStr = outputDisplay.text!
                runningNumber = ""
                currentSign = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                leftValStr = result
                outputDisplay.text = result
            }
            currentOperation = op
            
        } else { if runningNumber != "" {
            leftValStr = outputDisplay.text!
            runningNumber = ""
            currentOperation = op
            currentSign = ""
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

