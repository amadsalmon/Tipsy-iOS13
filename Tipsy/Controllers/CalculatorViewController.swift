//
//  ViewController.swift
//  Tipsy
//
//  Created by Amad Salmon on 16/07/2020.
//  Copyright © 2020 Amad Salmon. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    /* Reference to the Model */
    var calculatorBrain = CalculatorBrain()
    
    
    /* Text Fields */
    @IBOutlet weak var billTextField: UITextField!
    
    /* Buttons */
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    /* Labels */
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    /* IB Actions */
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Deselect all three buttons and select only the one that the user touched.
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        billTextField.endEditing(true) // To dismiss keyboard.
                
        switch sender.currentTitle {
        case "0%":
            calculatorBrain.selectedTip=0.0
        case "10%":
            calculatorBrain.selectedTip=0.10
        case "20%":
            calculatorBrain.selectedTip=0.20
        default:
            print("tipChanged() -> Could not find corresponding tip (sender.currentTitle). ;")
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        billTextField.endEditing(true) // To dismiss keyboard.
        calculatorBrain.splitNumber = Int(sender.value)
        splitNumberLabel.text = String(calculatorBrain.getSplitNumber())
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.billTotal = Float(billTextField.text!)
                        
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.billTotal = calculatorBrain.billTotal
            destinationVC.selectedTip = calculatorBrain.selectedTip
            destinationVC.splitNumber = calculatorBrain.splitNumber
            destinationVC.perPersonTotal = calculatorBrain.calculatePerPersonTotal()
        }
    }
    
    
}

