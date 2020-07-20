//
//  ViewController.swift
//  Tipsy
//
//  Created by Amad Salmon on 16/07/2020.
//  Copyright © 2020 Amad Salmon. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    /* Text Fields */
    @IBOutlet weak var billTextField: UITextField!
    
    /* Buttons */
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    /* Labels */
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billTotal:Float?
    var selectedTip:Float?
    var splitNumber:Int?
    var calculatedPerPerson:Float?
    
    
    /* IB Actions */
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
        
        print("tipChanged() -> sender.currentTitle = \(sender.currentTitle ?? "nil") ;" )
        
        switch sender.currentTitle {
        case "0%":
            selectedTip=0.0
        case "10%":
            selectedTip=0.10
        case "20%":
            selectedTip=0.20
        default:
            print("tipChanged() -> Could not find corresponding tip (sender.currentTitle). ;")
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        calculatorBrain.splitNumber = Int(sender.value)
        splitNumberLabel.text = calculatorBrain.getSplitNumber()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.billTotal = Float(billTextField.text!)
        
        let billTotalWithTip = (billTotal ?? 0.0) + ((billTotal ?? 0.0) * (selectedTip ?? 0.0))
        calculatedPerPerson = billTotalWithTip / Float(splitNumber ?? 2)
                
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.billTotal = billTotal
            destinationVC.selectedTip = selectedTip
            destinationVC.splitNumber = splitNumber
            destinationVC.calculatedPerPerson = calculatedPerPerson
        }
    }
    
    
}

