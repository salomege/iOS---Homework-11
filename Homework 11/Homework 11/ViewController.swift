//
//  ViewController.swift
//  Homework 11
//
//  Created by salome on 23.10.23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var SwitchButton: UISwitch!
    @IBOutlet private weak var switchLable: UILabel!
    @IBOutlet private weak var forN1: UITextField!
    @IBOutlet private weak var forN2: UITextField!
    @IBOutlet private weak var result: UILabel!
    @IBOutlet private weak var calculateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forN1.keyboardType = .numberPad
        forN2.keyboardType = .numberPad

    }
    
    @IBAction private func SwitchToChange(_ sender: Any) {
        if SwitchButton.isOn {
            switchLable.text = "GCD"
        } else {
            switchLable.text = "LCM"
            
        }
    }
    
    @IBAction private func calculate(_ sender: Any) {
             
        if  switchLable.text == "GCD",
            let text1 = forN1.text,
            let text2 = forN2.text,
            let number1 = Int(text1),
            let number2 = Int(text2) {
            let gcdResult = calculateGCD(number1, number2)
            result.text = "\(gcdResult)"
        }else if
            switchLable.text == "LCM",
            let text1 = forN1.text,
            let text2 = forN2.text,
            let number1 = Int(text1),
            let number2 = Int(text2) {
            let lcmResult = calculateLCM(number1, number2)
            result.text = "\(lcmResult)"
        } else {
            result.text = "Invalid input. Please enter two valid numbers."
        }
    }
    
    func calculateGCD(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        
        while y != 0   {
            let temp = y
            y = x % y
            x = temp
        }
        return x
    }
    
    func calculateLCM(_ a: Int, _ b: Int) -> Int {
        a * b / calculateGCD(a, b)
    }
}

