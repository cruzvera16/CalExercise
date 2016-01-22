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
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation = ""
    var currentSign = ""
    var result = ""
    
    
    @IBAction func numberPressed(btn: UIButton!) {
        runningNumber += "\(btn.tag)"
        outputDisplay.text = runningNumber
    }
    
    @IBAction func dotPressed(dot: UIButton) {
        runningNumber += "."
        outputDisplay.text = runningNumber
    }
    
    @IBAction func signPressed(sign: UIButton) {
        if currentSign != "" {
            currentSign = "-"
        } else {
            currentSign = ""
        }
    
        outputDisplay.text = "\(currentSign) \(runningNumber)"
        runningNumber = outputDisplay.text!
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

