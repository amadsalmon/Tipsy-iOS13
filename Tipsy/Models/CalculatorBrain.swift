//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Amad Salmon on 20/07/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

public struct CalculatorBrain {
    var billTotal:Float?
    var selectedTip:Float?
    var splitNumber:Int?
    var perPersonTotal:Float?
    
    func getSplitNumber() -> Int{
        if let res = splitNumber {
            return res
        } else {
            return -1
        }
        
    }
    
    func calculateBillTotalWithTip() -> Float{
        return (billTotal ?? 0.0) + ((billTotal ?? 0.0) * (selectedTip ?? 0.0))
    }
    
    func calculatePerPersonTotal() -> Float{
        return calculateBillTotalWithTip() / Float(splitNumber ?? 2)
    }
}


