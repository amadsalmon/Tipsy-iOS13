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
        
        print("tipChanged() -> selectedTip = \(selectedTip ?? -1) ;" )
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber ?? 2)
        print("stepperChanged() -> splitNumber = \(splitNumber ?? 2) ;")
        print("stepperChanged() -> splitNumberLabel.text = \(splitNumberLabel.text!) ;")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Float(billTextField.text!)
        print("calculatePressed() -> billTotal = \(billTotal ?? -1) ;" )
        print("calculatePressed() -> selectedTip = \(selectedTip ?? -1) ;" )
        print("calculatePressed() -> splitNumber = \(splitNumber ?? 2) ;" )
        
        let billTotalWithTip = (billTotal ?? 0.0) + ((billTotal ?? 0.0) * (selectedTip ?? 0.0))
        print("calculatePressed() -> billTotalWithTip = \(billTotalWithTip) ;" )
        calculatedPerPerson = billTotalWithTip / Float(splitNumber ?? 2)
        
        print("calculatePressed() -> calculatedPerPerson = \(String(format:"%.2f", calculatedPerPerson!)) ;" )
        
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

