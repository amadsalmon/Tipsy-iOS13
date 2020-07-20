//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Amad Salmon on 16/07/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var billTotal:Float?
    var selectedTip:Float?
    var splitNumber:Int?
    var calculatedPerPerson:Float?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        totalLabel.text = String(format:"%.2f", calculatedPerPerson ?? 0.0)
        adviceLabel.text = "Split between \(splitNumber ?? 2) people, with \((selectedTip ?? 0.0) * 100)% tip."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
